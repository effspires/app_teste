import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/view/back/usuario_form_back.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UsuarioForm extends StatelessWidget {
  UsuarioForm({ Key? key }) : super(key: key);

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _back = UsuarioFormBack(context);
    var maskPhone = MaskTextInputFormatter(mask: '(##) # ####-####');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
        backgroundColor: const Color(0xff237e84),
        actions: [
          IconButton(
              onPressed: (() {
                _form.currentState!.validate();
                _form.currentState!.save(); //Chama a atribuição de cada campo
                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              }),
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  validator: _back.validateName,
                  onSaved: (newValue) => _back.usuario!.nome = newValue,
                  initialValue: _back.usuario!.nome,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Nome:',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: _back.validateEmail,
                  onSaved: (newValue) => _back.usuario!.email = newValue,
                  initialValue: _back.usuario!.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email:',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: _back.validateSenha,
                  onSaved: (newValue) => _back.usuario!.senha = newValue,
                  initialValue: _back.usuario!.senha,
                  decoration: const InputDecoration(
                    labelText: 'Senha:',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('* Mínimo 6 e máximo 8 caracteres!'),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: _back.validatePhone,
                  onSaved: (newValue) => _back.usuario!.telefone = newValue,
                  initialValue: _back.usuario!.telefone,
                  inputFormatters: [maskPhone],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Telefone:',
                    hintText: '(99) 9 9999-9999',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onSaved: (newValue) => _back.usuario!.avatar = 'assets/images/' + newValue!,
                  initialValue: _back.usuario!.avatar,
                  decoration: const InputDecoration(
                    labelText: 'Nome da imagem:',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}