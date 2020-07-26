import 'package:flutter/material.dart';
class RestorePassword extends StatefulWidget {
  @override
  _RestorePasswordState createState() => _RestorePasswordState();
}
class _RestorePasswordState extends State<RestorePassword> {
  Color textColor = Color(0xff5B7FFF);
  final _formKey=GlobalKey<FormState>();
  TextEditingController _textEditingControllerPassword =TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _textEditingControllerPassword.dispose();
  }

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
                                controller: _textEditingControllerPassword,
                                style: TextStyle(color: textColor),

                                decoration: InputDecoration(
                                  hintText: 'كلمة المرور الجديدة ',
                                  prefixIcon:  Icon(Icons.lock,size: 20,),

                                  hintStyle: TextStyle(color: Colors.black,fontSize: 14),

                                ),
                                obscureText: true,
                                validator: (value) {
                                  if(value.isEmpty){
                                    return"الرجاء ادخال كلمة المرور";
                                  }
                                },
                              ) ,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child:TextFormField(

                                style: TextStyle(color: textColor),

                                decoration: InputDecoration(
                                  hintText: 'تأكيد كلمة المرور',
                                  prefixIcon:  Icon(Icons.lock,size: 20,),

                                  hintStyle: TextStyle(color: Colors.black,fontSize: 14),

                                ),
                                obscureText: true,
                                validator: (value) {
                                  if(value!=_textEditingControllerPassword.text){
                                    return"كلمة السر غير متطابقتان";
                                  }
                                },
                              ) ,
                            ),
                            SizedBox(
                              height: 30,
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

                                  }

                                },
                                color: textColor,
                                child: Text(
                                  'حفظ',
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
