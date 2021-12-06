import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

class ContactFormBack {
  
  Contact? contact;
  final _service = GetIt.I.get<ContactService>();

  bool? _nameIsValid;
  bool? _emailIsValid;
  bool? _phoneIsValid;

  //@action
  bool get isValid => _nameIsValid! && _emailIsValid! && _phoneIsValid!;

  //Diferenciar novo com alteração
  ContactFormBack(BuildContext context){
    var parameter = ModalRoute.of(context)!.settings.arguments;
    contact = ((parameter == null) ? Contact() : parameter) as Contact?;
  }

  //Salvar
  save() async {
    await _service.save(contact!);
  }

  //Validações
  String? validateName(name){
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String? validateEmail(email){
    try {
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String? validatePhone(phone){
    try {
      _service.validatePhone(phone);
      _phoneIsValid = true;
      return null;
    } catch (e) {
      _phoneIsValid = false;
      return e.toString();
    }
  }
}