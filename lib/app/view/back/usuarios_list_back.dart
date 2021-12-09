import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/domain/entities/usuario.dart';
import 'package:flutter_application_1/app/domain/services/usuario_service.dart';
import 'package:flutter_application_1/app/my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'usuarios_list_back.g.dart';

class UsuarioListBack = _UsuarioListBack with _$UsuarioListBack;

abstract class _UsuarioListBack with Store{
  
  final _service = GetIt.I.get<UsuarioService>();

  //lista de contatos
  @observable
  Future<List<Usuario>>? list;
  
  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _UsuarioListBack(){
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Usuario? usuario]) {
    Navigator.of(context).pushNamed(MyApp.usuarioform, arguments: usuario).then(refreshList);
  }

  //método para chamar os detalhes
  goToDetails(BuildContext context, Usuario? usuario) {
    Navigator.of(context).pushNamed(MyApp.userdetails, arguments: usuario);
  }

  //excluir
  remove(int id){
    _service.remove(id);
    refreshList();
  }

}