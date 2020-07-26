import 'package:firebase_database/firebase_database.dart';

class NormalUser {
  String _id;
  String _name;
  String _email;
  String _password;
  String _type;




  NormalUser(this._id, this._name,this._email,this._password,this._type);

  NormalUser.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._email = obj['email'];
    this._password = obj['password'];
    this._type= obj['type'];



  }

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get type => _type;




  NormalUser.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.value['id'];
    _name = snapshot.value['name'];
    _email = snapshot.value['email'];
    _password = snapshot.value['password'];
    _type = snapshot.value['type'];








  }
}
