import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/department/department.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Start extends StatefulWidget {


  @override
  _StartAddPostState createState() => _StartAddPostState();
}



FirebaseAuth myAuth = FirebaseAuth.instance;


String _name;
String _id;
String _email;
String _password;
String _type;



class _StartAddPostState extends State<Start> {
  Color textColor = Color(0xff5B7FFF);


  Future<FirebaseUser> getuid() async {

    return await myAuth.currentUser().then((user) {
      getuserData(user.uid).then((value){
        if(user !=null){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {


              return  Department(NormalUser(_id, _name, _email, _password, _type),true);

            }),
                (Route<dynamic> route) => false,
          );
        }
      });
    });
  }




  @override
  void initState() {
    super.initState();

    loadlogin().then((value) {

      if(value =='logedin'){
        _progressBar();
        Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) {


          return  Department(NormalUser(_id, _name, _email, _password, _type),false);

        }), (route) => false);
      }else if(value!='logedin'){

        getuid().then((value) {
          _progressBar();

          if(value!=null){
            getuid();
          }else{
            Navigator.pop(context);
          }
        });

      }else{
        print('null');
      }

    });



  }
  String dropdownDepartmentName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('حقيبة المناعة',style: TextStyle(color: textColor, fontFamily: 'Cairo'),),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          iconTheme:IconThemeData(color: textColor) ,
        ),
    
        body: new Container(

          child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      width:MediaQuery.of(context).size.width *0.4,
                      height: MediaQuery.of(context).size.width *0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/start1.png'),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width *0.85,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('مرحبا بكم في تطبيق حقيبة المناعة . هذا التطبيق سيساعدك على معرفة مختلفة المجالات والأمور التي تأثرت نتيجة فايروس كورونا وايضا طرق الوقاية وغيرها من الأمور',
                          style: TextStyle(color: Colors.black,fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      width: MediaQuery.of(context).size.width ,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ]),
                      child: FlatButton(

                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');

                        },
                        color: textColor,
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Cairo'),
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width ,
                      padding: EdgeInsets.only(left: 10,right: 10),

                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ]),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signUP');
                        },
                        color: textColor,
                        child: Text(
                          'انشاء الحساب',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Cairo'),
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),

              new FlatButton(onPressed: (){

                savelogin().then((value) {
                  Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) {


                    return  Department(NormalUser(_id, _name, _email, _password, _type),false);

                  }), (route) => false);

                });

              },
                child: Text('تخطي',
                  style: TextStyle(color: Colors.redAccent, fontSize: 24, fontFamily: 'Cairo'),
                ),)


            ],
          ),
        ),
    );
  }


  Future getuserData(String uid)async{
    final db = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('name')
        .once().then((value) {

      _name =value.value;
      print(_name);

    });
    final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('id')
        .once().then((value) {

      _id =value.value;
      print(_id);

    });

    final db3 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('email')
        .once().then((value) {

      _email =value.value;
      print(_email);

    });

    final db4 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('password')
        .once().then((value) {

      _password =value.value;
      print(_password);

    });

    final db5 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid).child('type')
        .once().then((value) {

      _type =value.value;
      print(_type);

    });

  }



  savelogin()async{

   SharedPreferences  pref = await SharedPreferences.getInstance();

      setState(() {

        final key ='1';
        final value = 'logedin';
        pref.setString(key,value);




      });



  }



  Future<String> loadlogin()async{

    SharedPreferences sp = await  SharedPreferences.getInstance();
    sp.getString('1');

    return  sp.getString('1');
  }


  Future<Widget> _progressBar() async {

    return (await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new GFLoader(
              type: GFLoaderType.custom,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(


                    child:AnimatedOpacity(
                      child: new Container(
                        height: 200,
                        width: 200,
                        child:  Lottie.asset('images/data.json'),
                      ),
                      opacity:  1,
                      duration: const Duration(seconds: 1),
                      alwaysIncludeSemantics: false,

                    ),
                  )
                ],
              )
          );
        }
    ));
  }


}


