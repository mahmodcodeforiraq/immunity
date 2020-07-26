import 'dart:async';
import 'dart:ui';

import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/Models/Posts.dart';
import 'package:Immunity_Box/addPost/addPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class showTechnologyContres extends StatefulWidget {
  NormalUser _normalUser;



  showTechnologyContres(this._normalUser);

  @override
  _showTechnologyContresState createState() =>
      _showTechnologyContresState();
}




DatabaseReference contresRefrance;

bool showAddPost=false;

class _showTechnologyContresState extends State<showTechnologyContres> {



  StreamSubscription<Event> _onPostAddedStreamSub;
  StreamSubscription<Event> _onPostUpdatedStreamSub;
  List<Posts> items;

  Future<FirebaseUser> getuid() async {

    return await myAuth.currentUser();
  }




  @override
  void initState(){
    getuid().then((user){
      if(user !=null){

        setState(() {
          showAddPost=false;

        });

      }else{

        setState(() {

          showAddPost=true;

        });

      }
    });

    items=new List();

    contresRefrance =  FirebaseDatabase.instance.reference().child('Users').child('conteresWork');

    _onPostAddedStreamSub =
        contresRefrance.onChildAdded.listen(_onPostAdded);
    _onPostUpdatedStreamSub =
        contresRefrance.onChildChanged.listen(_onPostUpdated);



  }

  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child:widget._normalUser.type=='admin'? Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton:  FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPost('اضافة',widget._normalUser.name,'','','','tec')));
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: contaierSuccessStories(context),
            ),
            SizedBox(height: 15,),

            new Expanded(child:  new Container(
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
                              side: new BorderSide(color: Colors.blue,
                                width: 1,
                              )
                          ),
                          child: new Column(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[

                              new ListTile(
                                title:new Column(
                                  children: <Widget>[

                                    new Container(
                                      height: 150,
                                      width: 300,
                                      padding: EdgeInsets.only(bottom: 10),

                                      child:    new ClipRRect(
                                        borderRadius: new BorderRadius.circular(10),
                                        child: new Image.network(items[position].image,scale: 5,fit: BoxFit.fitWidth,),
                                      ),

                                    ),

                                    new Column(
                                      textDirection:  TextDirection.rtl,
                                      children: <Widget>[
                                        new Divider(
                                          height: 3,
                                          color: Colors.black,
                                        ),
                                        new Container(
                                          alignment: Alignment.centerRight,
                                          child:   new Text(items[position].post,style: TextStyle(fontSize: 18),textDirection: TextDirection.rtl,),
                                        ),


                                      ],

                                    )
                                  ],
                                ) ,



                              )

                            ],
                          ),
                        )

                      ],
                    );
                  }),
            ))
          ],

        ),
      ):
      Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: contaierSuccessStories(context),
            ),
            SizedBox(height: 15,),

            new Expanded(child:  new Container(
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
                              side: new BorderSide(color: Colors.blue,
                                width: 1,
                              )
                          ),
                          child: new Column(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[

                              new ListTile(
                                title:new Column(
                                  children: <Widget>[

                                    new Container(
                                      height: 150,
                                      width: 300,
                                      padding: EdgeInsets.only(bottom: 10),

                                      child:    new ClipRRect(
                                        borderRadius: new BorderRadius.circular(10),
                                        child: new Image.network(items[position].image,scale: 5,fit: BoxFit.fitWidth,),
                                      ),

                                    ),

                                    new Column(
                                      textDirection:  TextDirection.rtl,
                                      children: <Widget>[
                                        new Divider(
                                          height: 3,
                                          color: Colors.black,
                                        ),
                                        new Container(
                                          alignment: Alignment.centerRight,
                                          child:   new Text(items[position].post,style: TextStyle(fontSize: 18),textDirection: TextDirection.rtl),
                                        ),


                                      ],

                                    )
                                  ],
                                ) ,



                              )

                            ],
                          ),
                        )

                      ],
                    );
                  }),
            ))
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
            new Padding(padding: EdgeInsets.only(top: 10)),
            containerImage(context, 'images/Group298.png'),

            centerAddress('عمل البلدان للحد من انتشار كورونا'),

          ],
        )
    );
  }


  Widget containerImage(BuildContext context, String imagePath) {
    return Container(
      width:100,
      height: 100,

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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPost('تعديل','','','','','tec')));
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
