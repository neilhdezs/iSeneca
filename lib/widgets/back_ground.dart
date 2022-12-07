import 'package:flutter/material.dart';
// El fondo de pantalla del login
class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {

    // Tamaños de la pantalla
    double height = MediaQuery.of(context).size.height; // Altura

    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(2, 86, 157, 1),
          height: height*0.185-2.1,
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                const Expanded(
                  child: Image(
                    image: AssetImage('assets/iseneca.png')
                  ),
                ),
                SizedBox(
                  height: (height*0.25)*0.20-3,
                  width: 1,
                )
              ],
            )
          ),
        ),
        Container(
          color: Colors.white,
          height: height-(height*0.2496)
        )
      ],
    );
  }
}
