import 'package:Immunity_Box/Models/NormalUser.dart';
import 'package:Immunity_Box/aboutInitiative/aboutInitiative.dart';
import 'package:Immunity_Box/department/department.dart';
import 'package:Immunity_Box/restorePassword/restorePassword.dart';
import 'package:Immunity_Box/restorePassword/sendEmail.dart';
import 'package:Immunity_Box/settingsAccount/settingsAccount.dart';
import 'package:Immunity_Box/signin/signin.dart';
import 'package:Immunity_Box/signup/signup.dart';
import 'package:Immunity_Box/staff/staff.dart';
import 'package:Immunity_Box/start/start.dart';
import 'package:Immunity_Box/viewInformation/AllPageOfSeccesss.dart';
import 'package:Immunity_Box/viewInformation/AllPageOfTecnology.dart';
import 'package:Immunity_Box/viewInformation/showAwerenessDepartment.dart';
import 'package:Immunity_Box/viewInformation/showCoronaBenefitsDepartment.dart';
import 'package:Immunity_Box/viewInformation/showGuidanceDepartment.dart';
import 'package:Immunity_Box/viewInformation/showDiseasesDepartment.dart';
import 'package:Immunity_Box/viewInformation/showSuccessStoriesDepartment.dart';
import 'package:Immunity_Box/viewInformation/showTechnologyContres.dart';
import 'package:flutter/material.dart';

import 'aboutApplication/aboutApplication.dart';
import 'addPost/addPost.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حقيبة المناعة',
      initialRoute: '/start',
       theme: ThemeData(
         iconTheme: IconThemeData(color: Colors.deepPurple) ,
         fontFamily: 'Cairo'
       ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/start':(context)=>Start(),
        '/department':(context)=>Department(NormalUser('', '', '', '', ''),true),
        '/signin':(context)=>Signin(),
        '/signUP':(context)=>SignUp(),
        '/aboutApplication':(context)=>AboutApplication(),
        '/aboutInitiative':(context)=>AboutInitiative(),
        '/staff':(context)=>Staff(),
        '/restorePassword':(context)=>RestorePassword(),
        '/sentEmail':(context)=>SendEmail(),
        '/settingsAccount':(context)=>SettingsAccount('','','','',''),
        '/showGuidanceDepartment':(context)=>ShowGuidanceDepartment(),
        '/showAwerenessDepartment':(context)=>ShowAwerenessDepartment(),
        '/showCoronaBenefitsDepartment':(context)=>ShowCoronaBenefitsDepartment(),
        '/showDiseasesDepartment':(context)=>ShowDiseasesDepartment(),
        '/AllPageOfTecnology':(context)=>AllPageOfTecnology(NormalUser('', '', '', '', '')),
        '/showSuccessStoriesDepartment':(context)=>ShowSuccessStoriesDepartment(NormalUser('', '', '', '', '')),
        '/AllPageOfSeccesss':(context)=>AllPageOfSeccesss(NormalUser('', '', '', '', '')),


      },
    );
  }
}
