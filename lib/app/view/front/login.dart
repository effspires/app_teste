import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/view/back/login_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginBack = LoginBack();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _loginBack.getContext(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: SizedBox(
                        width: 200,
                        height: 150,
                        child: Image.asset('assets/images/voalle-logo.png'),
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.only(left: 16),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.account_circle, color: Color(0xff237e84),),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: _loginBack.setEmail,
                          enabled: !_loginBack.loading,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) {
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.only(left: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.lock, color: Color(0xff237e84)),
                            suffixIcon: IconButton(
                              icon: _loginBack.passVisible
                                  ? const Icon(Icons.visibility_off, color: Color(0xff237e84))
                                  : const Icon(Icons.visibility, color: Color(0xff237e84)),
                              onPressed: _loginBack.togglePassVisible,
                            ),
                          ),
                          obscureText: !_loginBack.passVisible,
                          onChanged: _loginBack.setSenha,
                          enabled: !_loginBack.loading,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) {
                      return SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff237e84),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: _loginBack.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text('Acessar'),
                          onPressed: _loginBack.isFormValid
                              ? () {
                            _loginBack.acessar();
                                }
                              : null,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
