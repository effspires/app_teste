
import 'package:flutter_application_1/app/view/contact_details.dart';
import 'package:flutter_application_1/app/view/contact_form.dart';
import 'package:flutter_application_1/app/view/contact_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const
  home = '/',
  contactform = 'contact-form',
  contactdetails = 'contact-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        home: (context) => ContactList(),
        contactform: (context) => ContactForm(),
        contactdetails: (context) => const ContactDetails(),
      },
    );
  }
}