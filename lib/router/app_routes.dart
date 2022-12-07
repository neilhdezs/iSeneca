import 'package:iseneca/models/menu_option.dart';

import 'package:flutter/material.dart';
import 'package:iseneca/screens/alumnado_centro_screen.dart';
import 'package:iseneca/screens/alumnado_convivencia.dart';
import 'package:iseneca/screens/alumnado_expulsado.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOption = <MenuOption>[
    //MenuOption(route: 'home', icon: Icons.home_max_sharp, name: 'Home Screen', screen: LoginScreen(notifyNotFound: false,)),
    //MenuOption(route: 'dashboard', name: 'dashboard', screen: DashboardScreen(), icon: Icons.dashboard),
    MenuOption(route: 'personalCentro', name: 'personalCentro', screen: const PersonalCentroScreen(), icon: Icons.dashboard),
    MenuOption(route: 'alumnadoCentro', name: 'alumnadoCentro', screen: const AlumnadoCentroScreen(), icon: Icons.dashboard),
    MenuOption(route: 'alumnadoConvivencia', name: 'alumnadoConvivencia', screen: const AlumnadoConvivenciaScreen(), icon: Icons.dashboard),
    MenuOption(route: 'alumnadoExpulsado', name: 'alumnadoExpulsado', screen: const AlumnadoExpulsadoScreen(), icon: Icons.dashboard),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const LoginScreen()});

    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  // En vez de crearlo a pelo recorremos la lista con la información y creamos el mapa

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const ListView1Screen(),
  //   'listview2': (BuildContext context) => const ListView2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };

  // static Route<dynamic> onGenerateRoute(RouteSettings setting) {
  //   return MaterialPageRoute(builder: (context) => LoginScreen());
  // }
}
