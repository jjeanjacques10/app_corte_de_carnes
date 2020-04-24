import 'package:app_corte_de_carnes/screens/cortes_detalhes_screen.dart';
import 'package:app_corte_de_carnes/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_corte_de_carnes/screens/cortes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cortes App',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CortesSreen(),
        '/cortes_detalhes': (context) => CortesDetalhesScreen(),
        '/form': (context) => FormScreen()
      },
    );
  }
}
