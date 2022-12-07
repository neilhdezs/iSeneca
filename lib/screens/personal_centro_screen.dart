import 'package:flutter/material.dart';
import 'package:iseneca/models/user.dart';
import 'package:iseneca/providers/login_provider.dart';
import 'package:iseneca/screens/screens.dart';
import 'package:provider/provider.dart';


import '../widgets/widgets.dart';


class PersonalCentroScreen extends StatelessWidget {
  const PersonalCentroScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final User userLogin = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          PersonalCentro(userLogin: userLogin)
        ]
      ) ,
      bottomNavigationBar: const MyBottonNavigator()
    );
  }
}

class PersonalCentro extends StatelessWidget {
  const PersonalCentro({super.key, required this.userLogin});

  final User userLogin;

  @override
  Widget build(BuildContext context) {

    // Tamaños de la pantalla
    double width = MediaQuery.of(context).size.width; // Ancho
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
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView.separated(
              itemCount: usersProvider.listUsuario.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: ( _ , index) => _UserItem(user: usersProvider.listUsuario[index],)
            ),
          ),
        )

      ]
    );
  }
}

class _UserItem extends StatelessWidget {
  const _UserItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(userLogin: user))),
      leading: const Image(
          image: AssetImage('assets/no_image.jpg', ),
          width: 50,
          fit: BoxFit.contain,
        ),
  
      title: Text(user.nombreCompleto, style: const TextStyle(fontWeight: FontWeight.bold, color:Color.fromRGBO(2, 86, 157, 1),),),
      subtitle: Text(user.usuario, style: const TextStyle(color:Color.fromRGBO(2, 86, 157, 1),),),
    );
  }
}
