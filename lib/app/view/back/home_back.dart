import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/my_app.dart';

class HomeBack {

  logOut(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil(MyApp.loginform, (Route<dynamic> route) => false);
  }

  goToList(BuildContext context) {
    Navigator.of(context).pushNamed(MyApp.userslist);
  }
}