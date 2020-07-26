import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/Models/Posts.dart';
import 'package:Immunity_Box/addPost/addPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class ShowSuccessStoriesDepartment extends StatefulWidget {
  NormalUser _normalUser;



  ShowSuccessStoriesDepartment(this._normalUser);

  @override
  _ShowTechnologyDepartmentState createState() =>
      _ShowTechnologyDepartmentState();
}


DatabaseReference SuccessRefrance;

bool showAddPost=false;
class _ShowTechnologyDepartmentState extends State<ShowSuccessStoriesDepartment> {



  StreamSubscription<Event> _onPostAddedStreamSub;
  StreamSubscription<Event> _onPostUpdatedStreamSub;
  List<Posts> items;

  Future<FirebaseUser> getuid() async {

    return await myAuth.currentUser();
  }




  @override
void initState(){

  items=new List();

  SuccessRefrance =  FirebaseDatabase.instance.reference().child('Users').child('PostsSuccess');

  _onPostAddedStreamSub =
      SuccessRefrance.onChildAdded.listen(_onPostAdded);
  _onPostUpdatedStreamSub =
      SuccessRefrance.onChildChanged.listen(_onPostUpdated);



}

  Color textColor = Color(0xff5B7FFF);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child:Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton:  FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            getuid().then((user){
              if(user !=null){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPost('اضافة',widget._normalUser.name,'','','','sec')));

              }else{

                setState(() {

                  Alert();

                });

              }
            });
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
                                      child:    new ClipRRect(
                                        borderRadius: new BorderRadius.circular(10),
                                        child: new Image.network(items[position].image,scale: 5,fit: BoxFit.fitWidth,),
                                      ),

                                    ),

                                     new Column(
                                      textDirection:  TextDirection.rtl,
                                      children: <Widget>[
                                        new Text('${items[position].nameUser}',textAlign: TextAlign.center,textDirection: TextDirection.rtl),
                                        new Divider(
                                          height: 3,
                                          color: Colors.black,
                                        ),
                                        new Container(
                                          alignment: Alignment.centerRight,
                                          child:   new Text(items[position].post,style: TextStyle(fontSize: 18),),
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



  Future<void> Alert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
              side: new BorderSide(color:Color(0xffff006064) ,
                  width: 3)
          ),
          elevation: 6,
          content: new Text('يجب عليك اولا تسجيل الدخول',textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
          actions: <Widget>[
            new Center(
              child:new Row(
                children: <Widget>[

                  new FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: new Text('الغاء'),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10),
                      side: new BorderSide(color: Colors.black)
                    ),

                    textColor: Colors.black,

                  ),

                  new Padding(padding: EdgeInsets.only(left: 80)),
                  new FlatButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/signin').then((value) {
                        Navigator.of(context).pop();

                      }
                      );


                    },
                    child: new Text('تسجيل الدخول'),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10),
                        side: new BorderSide(color: Colors.black)
                    ),

                    textColor: Colors.black,

                  ),


                ],
              ),
            )
          ],

        );
      },
    );
  }


}
