import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/domain/entities/usuario.dart';
import 'package:url_launcher/url_launcher.dart';

class UsuarioDetailsBack {
  
  BuildContext context;
  Usuario? usuario;

  UsuarioDetailsBack(this.context){
    usuario = ModalRoute.of(context)!.settings.arguments as Usuario?;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError){
    _launchApp('tel:${usuario!.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError){
    _launchApp('sms:${usuario!.telefone}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError){
    _launchApp('mailto:${usuario!.email}', showModalError);
  }
}