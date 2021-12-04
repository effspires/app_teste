
import 'package:flutter_application_1/app/view/contact_form.dart';
import 'package:flutter_application_1/app/view/contact_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const
  home = '/',
  contact_form = 'contact-form';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        home: (context) => const ContactList(),
        contact_form: (context) => const ContactForm(),
      },
    );
  }
}