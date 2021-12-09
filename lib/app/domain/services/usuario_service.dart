import 'package:flutter_application_1/app/domain/entities/usuario.dart';
import 'package:flutter_application_1/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_application_1/app/domain/interfaces/usuarios_dao.dart';
import 'package:get_it/get_it.dart';

class UsuarioService{
  final _dao = GetIt.I.get<UsuariosDAO>();

  save(Usuario usuario){
    validateName(usuario.nome.toString());
    validateEmail(usuario.email.toString());
    validatePhone(usuario.telefone.toString());
    validatePass(usuario.senha.toString());

    _dao.save(usuario);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Usuario>> find(){
    return _dao.find();
  }

  findUser(String? email, String? senha) {
    return _dao.findUser(email, senha);
  }

  findPass(String? email) {
    return _dao.findPass(email);
  }

  validateName(String? name) {
    var min = 3;
    var max = 50;

    if(name == null) {
      throw DomainLayerExeption('O nome é obrigatório!');
    } else if(name.length < min) {
      throw DomainLayerExeption('O nome deve possuir pelo menos $min caracteres!');
    } else if(name.length > max) {
      throw DomainLayerExeption('O nome deve possuir no máximo $max caracteres!');
    }
  }

  validateEmail(String? email) {
    if(email == null) {
      throw DomainLayerExeption('O email é obrigatório!');
    } else if(!email.contains('@')) {
      throw DomainLayerExeption('O e-mail deve possuir @!');
    }
  }

  validatePhone(String? phone) {
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');

    if(phone == null) {
      throw DomainLayerExeption('O telefone é obrigatório!');
    } else if(!format.hasMatch(phone)) {
      throw DomainLayerExeption('O formato deve ser (99) 9 9999-9999!');
    }
  }

  validatePass(String? pass) {
    var min = 6;
    var max = 8;

    if(pass == null) {
      throw DomainLayerExeption('A senha é obrigatória!');
    } else if(pass.length < min || pass.length > max) {
      throw DomainLayerExeption('A senha deve conter entre $min e $max caracteres!');
    }
  }
}