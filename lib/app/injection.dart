import 'package:flutter_application_1/app/database/sqlite/dao/usuarios_dao_impl.dart';
import 'package:flutter_application_1/app/domain/interfaces/usuarios_dao.dart';
import 'package:flutter_application_1/app/domain/services/usuario_service.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getit = GetIt.I;

  getit.registerSingleton<UsuariosDAO>(UsuarioDAOImpl());
  getit.registerSingleton<UsuarioService>(UsuarioService());
}