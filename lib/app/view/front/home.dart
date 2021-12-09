import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/view/back/home_back.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _back = HomeBack();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindo'),
        backgroundColor: const Color(0xff237e84),
        actions: [
          SizedBox(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Tem certeza que quer sair?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () => _back.logOut(context),
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
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: ElevatedButton(
                    onPressed: () =>_back.goToList(context),
                    child: const Text(
                      'Lista de Usuários',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff237e84),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
