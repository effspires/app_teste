

import 'package:flutter_application_1/app/domain/entities/usuario.dart';

abstract class UsuariosDAO{
  save(Usuario usuario);

  remove(int id);

  Future<List<Usuario>> find();

  findUser(email, senha);
}