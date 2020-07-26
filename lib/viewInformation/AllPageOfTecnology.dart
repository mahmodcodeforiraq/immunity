import 'dart:async';
import 'dart:io';
import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/viewInformation/showMostafidStoriesDepartment.dart';
import 'package:Immunity_Box/viewInformation/showSuccessStoriesDepartment.dart';
import 'package:Immunity_Box/viewInformation/showTechnologyContres.dart';
import 'package:Immunity_Box/viewInformation/showTechnologyOfCorona.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AllPageOfTecnology extends StatefulWidget {
  NormalUser _normalUser;


  AllPageOfTecnology(this._normalUser);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateAllPageOfTecnology();
  }

}

FirebaseAuth myAuth = FirebaseAuth.instance;






class StateAllPageOfTecnology extends State<AllPageOfTecnology> {

  Color textColor = Color(0xff5B7FFF);

  bool back =false;



  int _selectedIndex = 0;

    List<Widget> _widgetOptions = [];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


@override
  void initState() {

    print(widget._normalUser.type);

  setState(() {

    _widgetOptions =<Widget>[

      showTechnologyContres(widget._normalUser),
      showTechnologyOfCorona(widget._normalUser),

    ];


  });
  super.initState();


}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        backgroundColor: Colors.white,


        appBar: AppBar(
          title: Text('قسم التكنلوجيا', style: TextStyle(color: textColor,fontSize: 18,fontFamily: 'Cairo'),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: textColor),
        ),

        body:new Container(
          child: new Column(

            children: <Widget>[

              new Container(
                child:  new  BottomNavigationBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  unselectedItemColor: Colors.black,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('images/pandemic.png'),size: 35),
                      title: Text('اعمال البلدان'),
                      backgroundColor: Colors.white,
                    ),

                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('images/covid.png'),size: 35,),
                      title: Text('التكنلوجيا وكورونا'),
                      backgroundColor: Colors.white,

                    ),

                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.blue,
                  onTap: _onItemTapped,

                ),
              ),
              new Expanded(child: new Container(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              ),


            ],
          ),
        )
    );
  }




  Future<bool> _onWillPop() async {

    return (await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
              side: new BorderSide(color: Color(0xffff006064),
                  width: 3)
          ),
          elevation: 6,
          title: Text(
            'هل تريد الخروج من التطبيق', textAlign: TextAlign.center,),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: new Row(
                children: <Widget>[
                  new Text('لا', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),),
                  new Icon(Icons.close, color: Colors.black,)
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  back =false;

                });
              },
            ),

            new Padding(padding: EdgeInsets.only(left: 100)),
            FlatButton(
              child: new Row(
                children: <Widget>[
                  new Text('نعم', style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
              onPressed: () {
                setState(() {

                  setState(() {
                    back =true;
                    exit(0);
                  });
                });


              },
            ),

          ],
        );
      },
    )) ?? back;
  }








}






