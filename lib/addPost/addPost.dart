import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:lottie/lottie.dart';

class AddPost extends StatefulWidget {
  String _editOrApp;
  String _tecOrSec;
  String _post;
  String _id;
  String _name;
  String _image;

  AddPost(this._editOrApp,this._name,this._post,this._id,this._image,this._tecOrSec);

  @override
  _AddPostState createState() => _AddPostState();
}

String uid;
FirebaseAuth myAuth=FirebaseAuth.instance;

class _AddPostState extends State<AddPost> {

  String appBarAdsress;

  TextEditingController _post = new TextEditingController();


  List<String> _departments;

  Future<FirebaseUser> getuid() async {

    return await myAuth.currentUser();
  }





  @override
  void initState() {
    super.initState();

    _post.text =widget._post;


    if(widget._tecOrSec=='sec' ||widget._tecOrSec=='قصص النجاح' || widget._tecOrSec=='المستفيدين من كورونا' ){

      _departments=[

        'المستفيدين من كورونا',

        'قصص النجاح'

      ];


    }else if(widget._tecOrSec=='tec' ||widget._tecOrSec=='تكنلوجيا وكورونا' || widget._tecOrSec=='اعمال البلدان' ){


      _departments=[

        'تكنلوجيا وكورونا',

        'اعمال البلدان'

      ];
    }




    getuid().then((user) => uid=user.uid);

    if(widget._editOrApp=='اضافة'){
      appBarAdsress="إضافة منشور";

    }else if(widget._editOrApp=='تعديل')

      appBarAdsress="تعديل المنشور";
  }

  Color textColor = Color(0xff5B7FFF);
  Color secondColor = Color(0xff1FCEC7);
  String dropdownDepartmentName;





  File imageFile;
  _openGellery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }



  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Text('اختر صورة'),
              content: SingleChildScrollView(
                child:  ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('المعرض'),
                      onTap: () {
                        _openGellery(context);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      child: Text('الكاميرا'),
                      onTap: () {
                        _openCamera(context);
                      },
                    ),
                  ],
                ),

              ),
            ),
          );
        });
  }

 Widget _decideImageView() {
    if (imageFile == null)
      return Text('');
    else
      return Image(
        image: FileImage(imageFile),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('$appBarAdsress',style: TextStyle(color: textColor),),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          iconTheme:IconThemeData(color: textColor) ,
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
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child:  Container(
                      width: MediaQuery.of(context).size.width/1.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child:TextField(
                              controller: _post,
                              style: TextStyle(color: textColor),
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'الموضوع...',
                                hintStyle: TextStyle(color: Colors.grey,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: textColor,),
                                ),

                              ),
                             
                            ) ,
                          ),


                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: FlatButton(
                                onPressed: (){
                                  _showDialog(context);
                                },
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('اضافة صورة',style: TextStyle(color: textColor,fontSize: 18),),
                                    Icon(Icons.add_circle,color:textColor,size: 30,),
                                  ],
                                )

                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _decideImageView(),
                          SizedBox(
                            height: 10,
                          ),

                           Container(

                               height: 45,
                               padding: EdgeInsets.only(right: 10,left: 10,top: 5),

                               decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey),
                                 borderRadius: BorderRadius.circular(10),

                               ),
                               child:DropdownButton(
                                   isExpanded: true,
                                   elevation:3,
                                   dropdownColor: Colors.white,
                                   iconEnabledColor: textColor,
                                   iconSize: 30,
                                   isDense: true,
                                   value: dropdownDepartmentName,
                                   hint: const Text('القسم',style: TextStyle(color: Color(0xff5B7FFF),fontSize: 18)),
                                   items: _departments.map<DropdownMenuItem<String>>(( value){
                                     return DropdownMenuItem<String>(
                                       value: value,
                                       child: Container( margin: EdgeInsets.only(left: 4,right: 4),
                                         child: Center(child: Text(value,style: TextStyle(color: secondColor),),),
                                       ),
                                     );
                                   }).toList()  ,
                                   onChanged: (newValue){
                                     setState(() {

                                       dropdownDepartmentName=newValue;

                                     });
                                   }
                               ) ,
                             ),

                          SizedBox(
                            height: 60,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width *0.5,
                            height: 45,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: textColor,
                                boxShadow: [
                                  BoxShadow(color: Colors.black12, blurRadius: 5),
                                ]),
                            child: RaisedButton(
                              onPressed: () {
                                if(dropdownDepartmentName==null){
                                  AlertIfDropDownNull();
                                }else{
                                  _progressBar();
                                  if(widget._editOrApp =='اضافة'){
                                    InsertPost().then((value) {
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                    });
                                  }else if(widget._editOrApp =='تعديل'){

                                    UpadatePost(widget._id).then((value) {
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                    });

                                  }


                                }
                              },
                              color: textColor,
                              child:widget._editOrApp=='اضافة'? Text(
                                'إضافة',
                                style: TextStyle(color: Colors.white, fontSize: 24,),
                              ):
                              Text(
                                'تعديل',
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

                ],
              ),
            ),

          ],
        )
    );
  }



  Future InsertPost()async{

    if(dropdownDepartmentName=='قصص النجاح'){

      final db = FirebaseDatabase.instance.reference().child('Users').child('PostsSuccess');

      String id =db.push().key;

      if (imageFile != null) {
        var imagepath =  '$id.jpg';


        StorageReference reference = FirebaseStorage.instance.ref().child(
            'posts_images/').child(imagepath);

        final StorageUploadTask task = reference.putFile(imageFile);

        await task.onComplete;

        reference.getDownloadURL().then((fileUrl) {

          db.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);
        reference.getDownloadURL().then((fileUrl) {

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });


      }else{
        AlertIfImageNull();
      }


    }else if(dropdownDepartmentName=='المستفيدين من كورونا'){



      final db = FirebaseDatabase.instance.reference().child('Users').child('PostsMostafad');

      String id =db.push().key;

      if (imageFile != null) {
        var imagepath =  '$id.jpg';


        StorageReference reference = FirebaseStorage.instance.ref().child(
            'posts_images/').child(imagepath);

        final StorageUploadTask task = reference.putFile(imageFile);

        await task.onComplete;

        reference.getDownloadURL().then((fileUrl) {

          db.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);
        reference.getDownloadURL().then((fileUrl) {

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });


      }else{
        AlertIfImageNull();
      }


    }else if(dropdownDepartmentName=='تكنلوجيا وكورونا'){



      final db = FirebaseDatabase.instance.reference().child('Users').child('tecWithcCorona');

      String id =db.push().key;

      if (imageFile != null) {
        var imagepath =  '$id.jpg';


        StorageReference reference = FirebaseStorage.instance.ref().child(
            'posts_images/').child(imagepath);

        final StorageUploadTask task = reference.putFile(imageFile);

        await task.onComplete;

        reference.getDownloadURL().then((fileUrl) {

          db.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);
        reference.getDownloadURL().then((fileUrl) {

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });


      }else{
        AlertIfImageNull();
      }


    }else if(dropdownDepartmentName=='اعمال البلدان'){



      final db = FirebaseDatabase.instance.reference().child('Users').child('conteresWork');

      String id =db.push().key;

      if (imageFile != null) {
        var imagepath =  '$id.jpg';


        StorageReference reference = FirebaseStorage.instance.ref().child(
            'posts_images/').child(imagepath);

        final StorageUploadTask task = reference.putFile(imageFile);

        await task.onComplete;

        reference.getDownloadURL().then((fileUrl) {

          db.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);
        reference.getDownloadURL().then((fileUrl) {

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });


      }else{
        AlertIfImageNull();
      }


    }


      }


  Future UpadatePost(String id)async{

    if(dropdownDepartmentName=='قصص النجاح'){

      final db = FirebaseDatabase.instance.reference().child('Users').child('PostsSuccess');


      if (imageFile != null) {
        var imagepath =  '$id.jpg';


        StorageReference reference = FirebaseStorage.instance.ref().child(
            'posts_images/').child(imagepath);

        final StorageUploadTask task = reference.putFile(imageFile);

        await task.onComplete;

        reference.getDownloadURL().then((fileUrl) {

          db.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);
        reference.getDownloadURL().then((fileUrl) {

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });


      }else{
        db.child(id).set({
          'id': id,
          'post': _post.text,
          'nameUser': widget._name,
          'image':widget._image,
          'type':dropdownDepartmentName,
        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':widget._image,
            'type':dropdownDepartmentName,
          });


      }





    }else if(dropdownDepartmentName=='المستفيدين من كورونا'){



      final db = FirebaseDatabase.instance.reference().child('Users').child('PostsMostafad');


      if (imageFile != null) {
        var imagepath =  '$id.jpg';


        StorageReference reference = FirebaseStorage.instance.ref().child(
            'posts_images/').child(imagepath);

        final StorageUploadTask task = reference.putFile(imageFile);

        await task.onComplete;

        reference.getDownloadURL().then((fileUrl) {

          db.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);
        reference.getDownloadURL().then((fileUrl) {

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });


      }else{
        db.child(id).set({
          'id': id,
          'post': _post.text,
          'nameUser': widget._name,
          'image':widget._image,
          'type':dropdownDepartmentName,
        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);

        db2.child(id).set({
          'id': id,
          'post': _post.text,
          'nameUser': widget._name,
          'image':widget._image,
          'type':dropdownDepartmentName,
        });
      }


    }else if(dropdownDepartmentName=='تكنلوجيا وكورونا'){



      final db = FirebaseDatabase.instance.reference().child('Users').child('tecWithcCorona');


      if (imageFile != null) {
        var imagepath =  '$id.jpg';


        StorageReference reference = FirebaseStorage.instance.ref().child(
            'posts_images/').child(imagepath);

        final StorageUploadTask task = reference.putFile(imageFile);

        await task.onComplete;

        reference.getDownloadURL().then((fileUrl) {

          db.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);
        reference.getDownloadURL().then((fileUrl) {

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });


      }else{
        db.child(id).set({
          'id': id,
          'post': _post.text,
          'nameUser': widget._name,
          'image':widget._image,
          'type':dropdownDepartmentName,
        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);

        db2.child(id).set({
          'id': id,
          'post': _post.text,
          'nameUser': widget._name,
          'image':widget._image,
          'type':dropdownDepartmentName,
        });
      }


    }else if(dropdownDepartmentName=='اعمال البلدان'){



      final db = FirebaseDatabase.instance.reference().child('Users').child('conteresWork');


      if (imageFile != null) {
        var imagepath =  '$id.jpg';


        StorageReference reference = FirebaseStorage.instance.ref().child(
            'posts_images/').child(imagepath);

        final StorageUploadTask task = reference.putFile(imageFile);

        await task.onComplete;

        reference.getDownloadURL().then((fileUrl) {

          db.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);
        reference.getDownloadURL().then((fileUrl) {

          db2.child(id).set({
            'id': id,
            'post': _post.text,
            'nameUser': widget._name,
            'image':fileUrl,
            'type':dropdownDepartmentName,
          });

        });


      }else{
        db.child(id).set({
          'id': id,
          'post': _post.text,
          'nameUser': widget._name,
          'image':widget._image,
          'type':dropdownDepartmentName,
        });

        final db2 = FirebaseDatabase.instance.reference().child('Users').child('NormalUser').child(uid);

        db2.child(id).set({
          'id': id,
          'post': _post.text,
          'nameUser': widget._name,
          'image':widget._image,
          'type':dropdownDepartmentName,
        });
      }


    }


  }


  Future<void> AlertIfImageNull() async {
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
          content: new Text('يجب اضافة صورة'),
          actions: <Widget>[
            new Center(
              child: new RaisedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: new Text('انهاء'),
                color: Colors.redAccent,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10)
                ),
                elevation: 5,
                textColor: Colors.white,

              ),
            )
          ],

        );
      },
    );
  }

  Future<void> AlertIfDropDownNull() async {
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
          content: new Text('يجب اختيار القسم'),
          actions: <Widget>[
            new Center(
              child: new RaisedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: new Text('انهاء'),
                color: Colors.redAccent,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10)
                ),
                elevation: 5,
                textColor: Colors.white,

              ),
            )
          ],

        );
      },
    );
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
