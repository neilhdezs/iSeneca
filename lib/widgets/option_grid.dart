import 'package:flutter/material.dart';

import '../models/models.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.asset,
    required this.text,
    required this.width,
    required this.height, 
    required this.userLogin,
    this.route = '',
  }) : super(key: key);

  final String asset;
  final double height;
  final String route;
  final String text;
  final User userLogin;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(route != '')
        {
          Navigator.pushNamed(context, route, arguments: userLogin);
        }
      },
      child: SizedBox(
        width: (width-42)/3,
        height: height/3.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(asset),
              color: const Color.fromRGBO(10, 156, 214, 1),
              height: 40,
              width: 40,
            ),
      
            const SizedBox(height: 5,),
            
            Text(text, textAlign: TextAlign.center , style: const TextStyle(color: Colors.black,),)
          ],
        ),
      )
    );
  }
}