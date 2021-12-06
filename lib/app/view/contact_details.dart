import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/view/contact_details_back.dart';


class ContactDetails extends StatelessWidget {
  const ContactDetails ({ Key? key }) : super(key: key);

  showModalError(BuildContext context){
    const alert = AlertDialog(
      title: Text('Alerta'),
      content: Text('Não foi possível encontrar o APP compatível!'),
    );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      }
    );
  }



  @override
  Widget build(BuildContext context) {

    var _back = ContactDetailsBack(context);
    Contact? contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        var width = constraints.biggest.width;
        var radius = width/3;
        //var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(60),
            children: [
              (Uri.tryParse(contact!.urlAvatar.toString())!.isAbsolute) ?
              CircleAvatar(
                backgroundImage: NetworkImage(contact.urlAvatar.toString()),
                radius: radius,
              ) :
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: width/2,
                ),
                radius: radius,
              ),
              Center(
                child: Text(
                  '${contact.nome}',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Telefone:'),
                  subtitle: Text('${contact.telefone}'),
                  trailing: SizedBox(
                    width: width/4,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            _back.launchSMS(showModalError);
                          },
                          icon: const Icon(Icons.message),
                          color: Colors.blue,
                        ),
                        IconButton(
                          onPressed: (){
                            _back.launchPhone(showModalError);
                          },
                          icon: const Icon(Icons.phone),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('E-mail:'),
                  subtitle: Text('${contact.email}'),
                  onTap: (){
                    _back.launchEmail(showModalError);
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );
      },
    
    );
  }
}