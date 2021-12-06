import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsBack {
  
  BuildContext context;
  Contact? contact;

  ContactDetailsBack(this.context){
    contact = ModalRoute.of(context)!.settings.arguments as Contact?;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError){
    _launchApp('tel:${contact!.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError){
    _launchApp('sms:${contact!.telefone}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError){
    _launchApp('mailto:${contact!.email}', showModalError);
  }
}