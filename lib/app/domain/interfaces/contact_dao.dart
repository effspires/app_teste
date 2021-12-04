import 'package:flutter_application_1/app/domain/entities/contact.dart';

abstract class ContactDAO{
  save(Contact contact);

  remove(int id);

  Future<List<Contact>> find();
}