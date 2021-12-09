import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/view/front/home.dart';
import 'package:flutter_application_1/app/view/front/login.dart';
import 'package:flutter_application_1/app/view/front/usuario_details.dart';
import 'package:flutter_application_1/app/view/front/usuario_form.dart';
import 'package:flutter_application_1/app/view/front/usuarios_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const loginform = '/';
  static const homeform = 'home-form';
  static const userslist = 'users-list';
  static const usuarioform = 'usuario-form';
  static const userdetails = 'user-det-form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff237e84),
        scaffoldBackgroundColor: const  Color(0xff7cadb0),
      ),
      routes: {
        loginform: (context) => const Login(),
        homeform: (context) => const Home(),
        userslist: (context) => UsuariosList(),
        usuarioform: (context) => UsuarioForm(),
        userdetails: (context) => const UsuarioDetails()
      },
    );
  }
}