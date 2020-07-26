import 'package:firebase_database/firebase_database.dart';

class Posts {
  String _id;
  String _post;
  String _image;
  String _nameUser;
  String _type;



  Posts(this._id, this._post,this._image,this._nameUser,this._type);

  Posts.map(dynamic obj) {
    this._id = obj['id'];
    this._post = obj['post'];
    this._image = obj['image'];
    this._nameUser = obj['nameUser'];
    this._type = obj['type'];




  }

  String get id => _id;
  String get post => _post;
  String get image => _image;
  String get nameUser => _nameUser;
  String get type => _type;




  Posts.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.value['id'];
    _post = snapshot.value['post'];
    _image = snapshot.value['image'];
    _nameUser = snapshot.value['nameUser'];
    _type = snapshot.value['type'];









  }
}
