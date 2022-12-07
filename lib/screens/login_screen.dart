import 'package:flutter/material.dart';
import 'package:iseneca/models/models.dart';
import 'package:iseneca/screens/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // Pantalla de login que tiene una pila, el fondo detras y encima el login
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {'user': 'User', 'password': 'user'};

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 82, 150, 1.000),
      body: Stack(
        children: [
          const Background(),
          Login(myFormKey: myFormKey, formValues: formValues),
        ]
      ),
    );
  }
}

// El fondo de pantalla del login
class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.8],
              colors: [Color(0xff005298), Color(0xff01315a)])),
    );
  }
}

// El login
class Login extends StatelessWidget {
  Login({
    Key? key,
    required this.myFormKey,
    required this.formValues,
  }) : super(key: key);

  final Map<String, String> formValues;
  List<User> listUsers = [];
  final GlobalKey<FormState> myFormKey;

  // Alerta a mostrar cuando se pulsa "He olvidado la contraseña"
  void displayOlvidadoPass(BuildContext context) {
    showDialog(
        barrierDismissible:
            false, // al crear la alerta si pulsas detras si se quita o no
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(15)),
            elevation: 5,
            title: const Text('Contacte con Soporte'),
            content: Column(mainAxisSize: MainAxisSize.min, children: const [
              Text(
                  'Si usted a olvidado la contraseña contacte con soporte, gracias'),
              SizedBox(height: 30),
              Icon(
                Icons.support_agent,
                size: 50,
              ),
            ]),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  void displayDialogPass(BuildContext context) {
    showDialog(
        barrierDismissible:
            true, // al crear la alerta si pulsas detras si se quita o no
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(15)),
            elevation: 5,
            title: const Text(
              'USER NOT FOUND',
              textAlign: TextAlign.center,
            ),
            content: Column(mainAxisSize: MainAxisSize.min, children: const [
              Text('El Usuario indicado no existe'),
              SizedBox(height: 30),
              Icon(
                Icons.info_outline,
                size: 50,
              ),
            ]),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<LoginProvider>(context, listen: true);

    // VENTANA CON FONDO DE PANTALLA Y PROPIO LOGIN

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(width: 100, height: 100),
                const Image(
                  image: AssetImage('assets/iseneca.png'),
                  width: double.infinity,
                  height: 95,
                ),
                const SizedBox(width: 100, height: 20),
                CustomInputField(
                  hintText: 'Usuario',
                  formValues: formValues,
                  formProperty: 'user',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputPass(
                  hintText: 'Contraseña',
                  formValues: formValues,
                  formProperty: 'password',
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton( // BOTON DE ENTRAR
                    onPressed: () 
                    {
                      bool infoNotFoundUser = true;
                      listUsers = usersProvider.listUsuario;
                      FocusScope.of(context).requestFocus(FocusNode());

                      if (!myFormKey.currentState!.validate()) 
                      {
                        return;
                      } 
                      else if (myFormKey.currentState!.validate()) 
                      {

                        for (var i = 0; i < listUsers.length; i++) 
                        {
                          if (formValues["user"] == listUsers[i].usuario && formValues["password"] == listUsers[i].clave) 
                          {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashBoardScreen(userLogin: listUsers[i]),), (route) => false);
                            infoNotFoundUser = false;
                          }
                        }

                        if (infoNotFoundUser) 
                        {
                          displayDialogPass(context);
                        }
                      }
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 82, 150, 1.000)),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () => displayOlvidadoPass(context),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(0, 255, 255, 255))),
                  child: const Text(
                    "No recuerdo mi contraseña",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(height: 100),
                const Image(
                  image: AssetImage('assets/juntaDeAndalucia.png'),
                  width: double.infinity,
                  height: 150,
                ),
                Container(
                    width: double.infinity,
                    child: const Text(
                      "v11.3.0",
                      textAlign: TextAlign.end,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
