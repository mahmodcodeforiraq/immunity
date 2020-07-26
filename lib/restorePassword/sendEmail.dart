import 'package:flutter/material.dart';
class SendEmail extends StatefulWidget {
  @override
  _SendEmailState createState() => _SendEmailState();
}
class _SendEmailState extends State<SendEmail> {
  Color textColor = Color(0xff5B7FFF);
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('استعادة كلمة المرور',style: TextStyle(color: textColor),),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: textColor),
        ),
        body: ListView(
          children: <Widget>[

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/login.png'),
                            fit: BoxFit.cover
                        ),
                        shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child:  Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child:TextFormField(

                                style: TextStyle(color: textColor),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'البريد الألكتروني',
                                  prefixIcon:  Icon(Icons.email,size: 20,),
                                  hintStyle: TextStyle(color: Colors.black,fontSize: 14),

                                ),
                                validator: (value) {
                                  if(value.isEmpty){
                                    return"الرجاء ادخال البريد الألكتروني";
                                  }
                                },
                              ) ,
                            ),


                            SizedBox(
                              height: 20,
                            ),

                            SizedBox(
                              height: 10,
                            ),


                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 45,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: Colors.black12, blurRadius: 5),
                                  ]),
                              child: RaisedButton(
                                onPressed: () {
                                  if(_formKey.currentState.validate())
                                  {
                                    Navigator.pushNamed(context, '/restorePassword');
                                  }

                                },
                                color: textColor,
                                child: Text(
                                  'ارسال',
                                  style: TextStyle(color: Colors.white, fontSize: 24,),
                                ),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        )
    );
  }
}
