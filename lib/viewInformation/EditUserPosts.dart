import 'dart:async';

import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/Models/Posts.dart';
import 'package:Immunity_Box/addPost/addPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EditUserPosts extends StatefulWidget {
  NormalUser _normalUser;


  EditUserPosts(this._normalUser);

  @override
  _EditUserPostsState createState() =>
      _EditUserPostsState();
}


DatabaseReference SuccessRefrance;

bool showAddPost=false;
class _EditUserPostsState extends State<EditUserPosts> {



  StreamSubscription<Event> _onPostAddedStreamSub;
  StreamSubscription<Event> _onPostUpdatedStreamSub;
  List<Posts> items;

  Future<FirebaseUser> getuid() async {

    return await myAuth.currentUser();
  }




  @override
void initState(){
    getuid().then((user){
      SuccessRefrance =  FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(user.uid);

      _onPostAddedStreamSub =
          SuccessRefrance.onChildAdded.listen(_onPostAdded);
      _onPostUpdatedStreamSub =
          SuccessRefrance.onChildChanged.listen(_onPostUpdated);

    });

  items=new List();




}

  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(

            color: Colors.blue, //change your color here
          ),

          title: new Text('تعديل منشوراتي',style: new TextStyle(color: Colors.blue),),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,

        ),
        backgroundColor: Colors.white,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 15,),

            new Expanded(child: items.length==0? new Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,

                child: new Text("لا توجد منشورات",style: new TextStyle(color: Colors.black,fontSize: 20),)):
                new Container(
                padding: EdgeInsets.only(left: 20,right: 20),
              child:  new ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, position) {
                    return new Column(
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        new Card(
                          elevation: 4,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10),
                              side: new BorderSide(color: Colors.red,
                                width: 1,
                              )
                          ),
                          child: new Column(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[

                              new ListTile(
                                  subtitle: Row(
                                      children: [

                                        new Column(
                                          children: <Widget>[
                                            new RaisedButton(
                                              onPressed: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) {


                                                    return  AddPost("تعديل",items[position].nameUser,items[position].post,
                                                        items[position].id,
                                                        items[position].image,
                                                        items[position].type);

                                                  }),
                                                );

                                              },
                                              child: new Text('تعديل',style: new TextStyle(color: Colors.white),),
                                              elevation: 0,
                                              color: Colors.blue,
                                              shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(10),

                                              ),

                                            ),
                                            new RaisedButton(
                                              onPressed: (){

                                                final db = FirebaseDatabase.instance.reference().child('Users');

                                                if(items[position].type =='المستفيدين من كورونا' ){
                                                  db.child('PostsMostafad').child(items[position].id).remove();
                                                  db.child('NormalUser').child(widget._normalUser.id).child(items[position].id).remove();
                                                  setState(() {
                                                    items.removeAt(position);
                                                  });
                                                }else if(items[position].type =='قصص النجاح'  ){
                                                  db.child('PostsSuccess').child(items[position].id).remove();
                                                  db.child('NormalUser').child(widget._normalUser.id).child(items[position].id).remove();

                                                  setState(() {
                                                    items.removeAt(position);
                                                  });
                                                } else if(items[position].type =='تكنلوجيا وكورونا' ){
                                                  db.child('tecWithcCorona').child(items[position].id).remove();
                                                  db.child('NormalUser').child(widget._normalUser.id).child(items[position].id).remove();

                                                  setState(() {
                                                    items.removeAt(position);
                                                  });
                                                }else if(items[position].type =='اعمال البلدان' ){
                                                  db.child('conteresWork').child(items[position].id).remove();
                                                  db.child('NormalUser').child(widget._normalUser.id).child(items[position].id).remove();

                                                  setState(() {
                                                    items.removeAt(position);
                                                  });
                                                }

                                              },
                                              child: new Text('حذف',style: new TextStyle(color: Colors.white),),
                                              elevation: 0,
                                              color: Colors.redAccent,
                                              shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(10),

                                              ),

                                            ),
                                          ],
                                        ),

                                        new Expanded(child:   new Column(
                                          textDirection:  TextDirection.rtl,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Container(
                                              child:  new Text('${items[position].nameUser}',style: new TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                            new Container(
                                              padding: EdgeInsets.only(left: 10,right: 10),
                                              child:    new Text(items[position].post,textDirection: TextDirection.rtl,),
                                            ),
                                            new Container(
                                              child: new Text("القسم: ${items[position].type}"),
                                            )


                                          ],

                                        ),),
                                        new Padding(padding: EdgeInsets.only(right:20)),
                                        new ClipRRect(
                                          borderRadius: BorderRadius.circular(1000),
                                          child: new Image.network(items[position].image,scale: 15,),
                                        ),
                                      ]
                                  )




                              )

                            ],
                          ),
                        )

                      ],
                    );
                  }),
            )

    )

          ],

        ),
      ),

    );
  }

  Widget contaierSuccessStories(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration:
        BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
        child: Column(
          children: <Widget>[
            containerImage(context, 'images/successStories.png'),

            centerAddress('قصص نجاح اشخاص اثناء الحجر'),

          ],
        )
    );
  }


  Widget containerPost1(BuildContext context, String text, String imagePath,int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.08,
                child: containerOpions(),
              ),
              onTap: () {
                _showDialog(context,index);
              },
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),

                    )

                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18.0, fontFamily: 'Cairo'),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),


              SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget containerPost2(BuildContext context, String text, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.08,
                child: containerOpions(),
              ),
              onTap: () {
                _showDialog(context,index);
              },
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18.0, fontFamily: 'Cairo'),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget containerOpions() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 5,
            height: 5,
            decoration:
            BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 5,
            height: 5,
            decoration:
            BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 5,
            height: 5,
            decoration:
            BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }

  Widget containerImage(BuildContext context, String imagePath) {
    return Container(
      width:200,
      height: 150,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
          )),
    );
  }

  Widget centerAddress(String address) {
    return Center(
      child: Text(
        address,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'Cairo'),
      ),
    );
  }
  Future<void> _showDialog(BuildContext context,int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: AlertDialog(

              content: SingleChildScrollView(
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListBody(
                    children: <Widget>[
                      GestureDetector(
                        child: Text('تعديل'),
                        onTap: () {

                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPost('تعديل','','','','','sec')));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Text('حذف'),
                        onTap: () {

                          Navigator.pop(context);

                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),


                    ],
                  ),
                ),

              ),
            ),
          );
        });
  }



  void _onPostAdded(Event event) {
    setState(() {
      items.add(new Posts.fromSnapShot(event.snapshot));
    });
  }

  void _onPostUpdated(Event event) {
    var oldEastFoodValue =
    items.singleWhere((eastFood) => eastFood.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldEastFoodValue)] =
      new Posts.fromSnapShot(event.snapshot);
    });
  }


}
