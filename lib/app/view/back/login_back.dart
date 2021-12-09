import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/usuario.dart';
import 'package:flutter_application_1/app/domain/interfaces/usuarios_dao.dart';
import 'package:flutter_application_1/app/my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'login_back.g.dart';

class LoginBack = _LoginBack with _$LoginBack;

abstract class _LoginBack with Store {

  final _service = GetIt.I.get<UsuariosDAO>();

  int? id;
  String? nome;
  String? avatar;
  List<Usuario>? list;
  Usuario? usuario;

  @action
  void getContext(BuildContext context) => ctx = context;

  @observable
  var ctx;

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String senha = "";

  @action
  void setSenha(String value) => senha = value;

  @computed
  bool get isEmailValid => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);

  @computed
  bool get isPassValid =>  senha.length > 5;

  @computed
  bool get isFormValid => isEmailValid && isPassValid;

  @observable
  bool passVisible = false;

  @action
  void togglePassVisible() => passVisible = !passVisible;

  @observable
  bool loading = false;

  @action
  acessar([dynamic value]) async {
    loading = true;

    list = await _service.findUser(email, senha);

    if(list!.isNotEmpty) {
      loggedIn = true;
      loading = false;
      goToHome(ctx);
    } else {
      loggedIn = false;
      loading = false;

      return ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        content: Text("Dados inválidos!"),
      ));
    }
  }

  @observable
  bool loggedIn = false;

  @computed
  bool get isLoged => loggedIn;

  goToHome(BuildContext context){
    Navigator.of(context).pushReplacementNamed(MyApp.homeform);
  }

  goToNew(BuildContext context, int val){
    Navigator.of(context).pushReplacementNamed(MyApp.usuarioform, arguments: null);
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? launch(url) : showModalError(ctx);
  }

  launchEmail(Function(BuildContext context) showModalError) async {
    if(isEmailValid) {
      list = await _service.findPass(email);

      if(list!.isNotEmpty) {
        String? password = list!.elementAt(0).senha;

        _launchApp('mailto:$email?subject=Recuperação de senha&body=Sua senha é $password.', showModalError);
      } else {
        return ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          content: Text("E-mail não cadastrado!"),
        ));
      }
    } else {
      return ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        content: Text("Informe o e-mail!"),
      ));
    }
  }
}