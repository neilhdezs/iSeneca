import 'package:flutter/material.dart';
import 'package:iseneca/models/models.dart';
import 'package:iseneca/providers/login_provider.dart';
import 'package:provider/provider.dart';


import '../widgets/widgets.dart';


class AlumnadoExpulsadoScreen extends StatelessWidget {
  const AlumnadoExpulsadoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final User userLogin = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          AlumnadoExpulsado(userLogin: userLogin)
        ]
      ) ,
      bottomNavigationBar: const MyBottonNavigator(),
    );
  }
}

class AlumnadoExpulsado extends StatelessWidget {
  const AlumnadoExpulsado({super.key, required this.userLogin});

  final User userLogin;

  @override
  Widget build(BuildContext context) {

    // Tamaños de la pantalla
    double height = MediaQuery.of(context).size.height; // Altura

    final usersProvider = Provider.of<LoginProvider>(context, listen: true);

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
            )
          ),
        ),

        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                ...usersProvider.listExpulsado.map((user) => _UserItem(user: user))
              ],
            ),
          ),
        )

      ]
    );
  }
}

class _UserItem extends StatelessWidget {
  const _UserItem({required this.user});

  final UserExpulsado user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Image(
          image: AssetImage('assets/no_image.jpg', ),
          width: 50,
          fit: BoxFit.contain,
        ),

      title: Text('${user.alumno} - ${user.curso}', style: const TextStyle(fontWeight: FontWeight.bold, color:Color.fromRGBO(2, 86, 157, 1),),),
      subtitle: Text('${user.fechaInicio} - ${user.fechaFin}', style: const TextStyle(color:Color.fromRGBO(2, 86, 157, 1),),),
    );
  }
}