import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';

import '../my_app.dart';

class ContactList extends StatelessWidget {
  const ContactList({ Key? key }) : super(key: key);

  /*final lista = [
    {'nome':'Fábio', 'telefone':'(55) 9 9159-5147', 'avatar':'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916__340.png'},
    {'nome':'Adriane Tim', 'telefone':'(55) 9 8115-5129', 'avatar':'https://cdn.pixabay.com/photo/2014/03/24/17/19/teacher-295387__340.png'},
    {'nome':'Adriane Claro', 'telefone':'(55) 9 9132-8971', 'avatar':'https://cdn.pixabay.com/photo/2014/03/24/17/19/teacher-295387__340.png'},
  ];*/

  Future<List<Contact>> _buscar() async{
    return ContactDAOImpl().find();
  }
  
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          List<Contact> lista = futuro.data as List<Contact>;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de Contatos'),
              actions: [
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed(MyApp.form);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i){
                var contato = lista[i];
                var avatar = CircleAvatar(backgroundImage: NetworkImage(contato.urlAvatar.toString()),);

                return ListTile(
                  leading: avatar,
                  title: Text(contato.nome.toString()),
                  subtitle: Text(contato.telefone.toString()),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){
                          
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: (){
                          
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Scaffold();
        }
      }
      
    );
  }
}