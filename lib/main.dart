import 'package:flutter/material.dart';
import 'package:iseneca/providers/login_provider.dart';
import 'package:iseneca/router/app_routes.dart';
import 'package:iseneca/screens/login_screen.dart';
import 'package:iseneca/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => LoginProvider(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => LoginScreen()),
        theme: AppTheme.darkTheme);
  }
}
