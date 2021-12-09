import 'package:flutter_application_1/app/database/sqlite/connection.dart';
import 'package:flutter_application_1/app/domain/entities/usuario.dart';
import 'package:flutter_application_1/app/domain/interfaces/usuarios_dao.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDAOImpl implements UsuariosDAO{
  Database? _db;

  @override
  Future<List<Usuario>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db!.query('usuarios');
    List<Usuario> lista = List.generate(resultado.length, (i){
      var linha = resultado[i];
      return Usuario(
        id: linha['id'],
        nome: linha['nome'],
        telefone: linha['telefone'],
        email: linha['email'],
        senha: linha['senha'],
        avatar: linha['avatar'],
      );
    });

    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    String sql = 'DELETE FROM usuarios WHERE id = ?';
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(Usuario usuario) async {
    _db = await Connection.get();
    String sql;
    if(usuario.id==null) {
      sql='INSERT INTO usuarios (nome, telefone, email, senha, avatar) VALUES (?, ?, ?, ?, ?)';
      _db!.rawInsert(sql, [usuario.nome, usuario.telefone, usuario.email, usuario.senha, usuario.avatar]);
    } else {
      sql = 'UPDATE usuarios SET nome = ?, telefone = ?, email = ?, senha = ?, avatar = ? WHERE id = ?';
      _db!.rawUpdate(sql, [usuario.nome, usuario.telefone, usuario.email, usuario.senha, usuario.avatar, usuario.id]);
    }
  }

  @override
  Future<List<Usuario>> findUser(email, senha) async {
    _db = await Connection.get();

    var sql ="SELECT * FROM usuarios WHERE email = '$email' and senha = '$senha'";
    List<Map<String, dynamic>> resultado = await _db!.rawQuery(sql);

    //conversão Map para usuario
    List<Usuario> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Usuario (
          id: linha['id'],
          nome: linha['nome'],
          avatar: linha['avatar']
      );
    });

    return lista;
  }

}