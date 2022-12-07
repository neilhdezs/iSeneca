import 'package:flutter/material.dart';

class MyBottonNavigator extends StatelessWidget {
  const MyBottonNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 35,
        selectedItemColor: const Color.fromRGBO(0, 82, 150, 1.000),
        unselectedItemColor: const Color.fromRGBO(164,164,164, 1),
        selectedFontSize: 12,
        unselectedFontSize: 11,
        onTap: (value) {
          if (value == 0) {
            Navigator.pop(context);
          }
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

      );
  }
}