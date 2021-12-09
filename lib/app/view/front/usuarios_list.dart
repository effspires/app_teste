import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/usuario.dart';
import 'package:flutter_application_1/app/view/back/usuarios_list_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UsuariosList extends StatelessWidget {
  UsuariosList({Key? key}) : super(key: key);

  final _back = UsuarioListBack();

  CircleAvatar circleAvatar(String url){
    return (Uri.tryParse(url)!.isAbsolute) ?
      CircleAvatar(backgroundImage: NetworkImage(url)) :
      const CircleAvatar(child: Icon(Icons.person), backgroundColor: Color(0xFF237e84));
  }

  Widget iconEditButton(Function editar){
    return IconButton(
      icon: const Icon(Icons.edit),
      color: const Color(0xFF237e84),
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
                child: const Text('Sim'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff237e84),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Não'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff237e84),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
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
          backgroundColor: const Color(0xff237e84),
          actions: [
            IconButton(
              onPressed: () {
                _back.refreshList();
              },
              icon: const Icon(Icons.refresh),
              color: const Color(0xff237e84),
            ),
            IconButton(
              onPressed: () {
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
                  List<Usuario> lista = futuro.data as List<Usuario>;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];

                      return ListTile(
                        leading: circleAvatar(contato.avatar.toString()),
                        title: Text(contato.nome.toString()),
                        onTap: (){
                          _back.goToDetails(context, contato);
                        },
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
