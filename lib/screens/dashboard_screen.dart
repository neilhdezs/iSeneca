import 'package:flutter/material.dart';


import '../models/models.dart';
import '../widgets/widgets.dart';


class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key, required this.userLogin}) : super(key: key);

  final User userLogin;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: 
          [

            const BackGround(),

            DashBoard(userLogin: userLogin),
            
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 35,
        selectedItemColor: const Color.fromRGBO(0, 82, 150, 1.000),
        unselectedItemColor: const Color.fromRGBO(164,164,164, 1),
        selectedFontSize: 12,
        unselectedFontSize: 11,
        onTap: (value) {
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Agenda',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Comunicaciones',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menú',
          ),
        ],

      ),
    );
  }
}



class DashBoard extends StatelessWidget {
  const DashBoard({super.key, required this.userLogin});

  final User userLogin;

  @override
  Widget build(BuildContext context) {

    // Tamaños de la pantalla
    double height = MediaQuery.of(context).size.height; // Altura

    return SingleChildScrollView(
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

            //Grid
            OptionsDashBoard(userLogin: userLogin)

          ],
        )
      ),
    );
  }
}

class OptionsDashBoard extends StatelessWidget {
  const OptionsDashBoard({super.key, required this.userLogin});

  final User userLogin;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Ancho
    double height = MediaQuery.of(context).size.height; // Altura
    return Column(
      children:[
        Row(
          children: [
            Option(width: width, height: height, asset: 'assets/sombrero.png', text: 'Alumnado del centro', route: 'alumnadoCentro', userLogin: userLogin),
            Container(height: height/3.5, width: 1, color: Colors.black12,),
            Option(width: width, height: height, asset: 'assets/profesor.png', text: 'Personal del \ncentro', route: 'personalCentro', userLogin: userLogin),
            Container(height: height/3.5, width: 1, color: Colors.black12,),
            Option(width: width, height: height, asset: 'assets/covid.png', text: 'Información\nCovid', userLogin: userLogin),
          ],
        ),
        Container(height: 1, width: double.infinity, color: Colors.black12,),
        Row(
          children: [
            Option(width: width, height: height, asset: 'assets/campana.png', text: 'Tablón de\nanuncios', userLogin: userLogin),
            Container(height: height/3.5, width: 1, color: Colors.black12,),
            Option(width: width, height: height, asset: 'assets/calendario.png', text: 'Calendario \nescolar', userLogin: userLogin),
            Container(height: height/3.5, width: 1, color: Colors.black12,),
            SizedBox(
              width: (width-62)/3,
              height: height/3.5,
            )
          ],
        ),
      ] 
    );
  }
}

