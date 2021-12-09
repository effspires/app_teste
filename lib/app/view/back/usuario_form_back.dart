import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/domain/entities/usuario.dart';
import 'package:flutter_application_1/app/domain/services/usuario_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/app/my_app.dart';
import 'package:path/path.dart';

class UsuarioFormBack {

  int? val;
  
  Usuario? usuario;
  final _service = GetIt.I.get<UsuarioService>();

  bool? _nameIsValid;
  bool? _emailIsValid;
  bool? _phoneIsValid;
  bool? _passIsValid;

  var parameter;

  BuildContext? ctx;

  //@action
  bool get isValid => _nameIsValid! && _emailIsValid! && _phoneIsValid! && _passIsValid!;

  //Diferenciar novo com alteração
  UsuarioFormBack(BuildContext context){
    ctx = context;
    parameter = ModalRoute.of(context)!.settings.arguments;
    usuario = ((parameter == null) ? Usuario() : parameter) as Usuario?;
  }

  //Salvar
  save() async {
    await _service.save(usuario!);
    if(parameter!=null) {
      Navigator.of(ctx!).pop();
    } else {
      saveAndBaclLoggin();
    }
  }

  saveAndBaclLoggin() async {
    Navigator.of(ctx!).pushNamedAndRemoveUntil(MyApp.loginform, (Route<dynamic> route) => false);
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

  String? validateSenha(pass){
    try {
      _service.validatePass(pass);
      _passIsValid = true;
      return null;
    } catch (e) {
      _passIsValid = false;
      return e.toString();
    }
  }
}