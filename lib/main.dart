import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/injection.dart';
import 'app/my_app.dart';

void main() {
  setupInjection();
  runApp(const MyApp());
}

/*void main() async {
  await BuscarDados();
}

Future BuscarDados(){
  return Future.delayed(Duration(seconds: 5), () => print('Carregou os dados!'));
}*/