import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/view/contact_list_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  ContactList({Key? key}) : super(key: key);

  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url){
    return (Uri.tryParse(url)!.isAbsolute) ?
      CircleAvatar(backgroundImage: NetworkImage(url)) :
      const CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(Function editar){
    return IconButton(
      icon: const Icon(Icons.edit),
      color: Colors.orange,
      onPressed: () {
        editar();
      },
    );
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Excluir'),
            content: const Text('Confirma a exclusão?'),
            actions: [
              ElevatedButton(
                onPressed: () => remove(),
                child: const Text('Sim')
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Não'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Contatos'),
          actions: [
            IconButton(
              onPressed: () {
                //Navigator.of(context).pushNamed(MyApp.contactform);
                 _back.goToForm(context);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  List<Contact> lista = futuro.data as List<Contact>;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];

                      return ListTile(
                        leading: circleAvatar(contato.urlAvatar.toString()),
                        title: Text(contato.nome.toString()),
                        subtitle: Text(contato.telefone.toString()),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(
                                () => _back.goToForm(context, contato),
                              ),
                              iconRemoveButton(context, () {
                                _back.remove(int.parse(contato.id.toString()));
                                Navigator.of(context).pop();
                              },
                            ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
