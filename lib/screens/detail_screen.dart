import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
    const DetailScreen({
      super.key,
      required this.userLogin
    });

  final User userLogin;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          Detail(userLogin: userLogin)
        ]
      ) ,
      bottomNavigationBar: const MyBottonNavigator(),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key, required this.userLogin});

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
      
              ],
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListView(
              children: [
                MyDataView(icono: const Icon(Icons.person, color: Color.fromRGBO(2, 86, 157, 1), size: 40,), title: 'Usuario', data: userLogin.usuario),
                const Divider(),
                MyDataView(icono: const Icon(Icons.abc_outlined, color: Color.fromRGBO(2, 86, 157, 1), size: 40,), title: 'Nombre Completo', data: userLogin.nombreCompleto),
                const Divider(),
                GestureDetector(
                  onTap: () => launch('tel://${userLogin.telefono}'),
                  child: MyDataView(icono: const Icon(Icons.call_outlined, color: Color.fromRGBO(2, 86, 157, 1), size: 40,), title: 'Telefono', data: userLogin.telefono)
                  ),
                const Divider(),
                GestureDetector(
                  onTap: () => launch('mailto:${userLogin.mail}'),
                  child: MyDataView(icono: const Icon(Icons.mail_outline, color: Color.fromRGBO(2, 86, 157, 1), size: 40,), title: 'Email', data: userLogin.mail)
                ),
                const Divider(),
                MyDataView(icono: const Icon(Icons.home_work_outlined, color: Color.fromRGBO(2, 86, 157, 1), size: 40,), title: 'Nombre Del Centro', data: userLogin.nombreDelCentro),
              ]
            ),
          )
        ),
      ]
    );
  }
}

class MyDataView extends StatelessWidget {
  const MyDataView({
    super.key,
    required this.icono,
    required this.title,
    required this.data,
    });

  final String data;
  final Icon icono;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icono,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color:Color.fromRGBO(2, 86, 157, 1),),),
      subtitle: Text(data, style: const TextStyle(color:Color.fromRGBO(2, 86, 157, 1),),),
    );
  }
}