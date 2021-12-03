import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
      ),
      body: ListView(),
    );
  }
}