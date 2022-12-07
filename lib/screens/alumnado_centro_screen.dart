import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class AlumnadoCentroScreen extends StatelessWidget {
  const AlumnadoCentroScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final User userLogin = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          AlumnadoCentro(userLogin: userLogin)
        ]
      ) ,
      bottomNavigationBar: const MyBottonNavigator(),
    );
  }
}

class AlumnadoCentro extends StatelessWidget {
  const AlumnadoCentro({super.key, required this.userLogin});

  final User userLogin;

  @override
  Widget build(BuildContext context) {

    // Tamaños de la pantalla
    double height = MediaQuery.of(context).size.height; // Altura
    
    return Column(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Espaciado entre Top y Cuador de Datos
                SizedBox(height: height*0.11, width: double.infinity,),
      
                // Cuadro de Datos
                CardDateButton(nombreCompleto: userLogin.nombreCompleto, nombreUsuario: userLogin.usuario, nombreDelCentro: userLogin.nombreDelCentro, ),
      
                const SizedBox(height: 20,),
      
              ],
            ),
          ),
        ),

        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  _Option(asset: 'assets/studentExpulsado.png', text: 'Estudiantes \nExpulsados', userLogin: userLogin, route: 'alumnadoExpulsado',),
                  Container(height: height/3.4, width: 1, color: Colors.black12,),
                  _Option(asset: 'assets/studentConvivencia.png', text: 'Estudiantes \nConvivencia', userLogin: userLogin, route: 'alumnadoConvivencia'),
                ],
              )
            ],
          )
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    this.route = '',
    required this.text,
    required this.asset,
    required this.userLogin,
    });

  final String asset;
  final String route;
  final String text;
  final User userLogin;

  @override
  Widget build(BuildContext context) {
    // Tamaños de la pantalla
    double width = MediaQuery.of(context).size.width; // Ancho
    double height = MediaQuery.of(context).size.height; // Altura

    return GestureDetector(
      onTap: () {
        if(route != '')
        {
          Navigator.pushNamed(context, route, arguments: userLogin);
        }
      },
      child: SizedBox(
        width: (width-1)/2,
        height: height/3.40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage(asset),
                color: const Color.fromRGBO(10, 156, 214, 1),
                height: 45,
                width: 45,
              ),
        
              const SizedBox(height: 5,),
              
              Text(text, textAlign: TextAlign.center , style: const TextStyle(color: Colors.black,),)
          ],
        ),
      ),
    );
  }
}