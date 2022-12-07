import 'package:flutter/material.dart';


class CardDateButton extends StatelessWidget {
  const CardDateButton({
    Key? key,
    required this.nombreUsuario, required this.nombreCompleto, required this.nombreDelCentro,
  }) : super(key: key);

  final String nombreCompleto;
  final String nombreDelCentro;
  final String nombreUsuario;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width; // Ancho;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color.fromARGB(255, 82, 82, 82)
          )
        ] ,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(nombreUsuario, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          
                    Row(
                      children: [
                        IconButton(onPressed: (() => ""), icon: const Icon(Icons.people_rounded, color: Colors.black,)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nombreDelCentro, style: const TextStyle(color: Color.fromRGBO(2, 86, 157, 1), fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Text(nombreCompleto, style: const TextStyle(color: Color.fromRGBO(2, 86, 157, 1), fontWeight: FontWeight.bold),),
                    const SizedBox(height: 7,),
                  ],
                ),

                

              ],
            ),
          ),
          _CardButton(width: width)
        ],
      ),
    );
  }
}


class _CardButton extends StatelessWidget {
  const _CardButton({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(1,157,218,1),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))
      ),
      height: 50,
      width: width-30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: (width-76)/2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.alarm),
                SizedBox(width: 10,),
                Text('Avisos', style: TextStyle(fontWeight: FontWeight.bold ),)
              ],
            ),
          ),

          const VerticalDivider(),

          SizedBox(
            width: (width-76)/2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.book_outlined),
                SizedBox(width: 10,),
                Text('Bandeja de firmas', style: TextStyle(fontWeight: FontWeight.bold ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
