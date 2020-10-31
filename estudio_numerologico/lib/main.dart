import 'package:estudio_numerologico/pages/segunda_pagina.dart';
import 'package:flutter/material.dart';
import 'package:estudio_numerologico/pages/pagina_de_inicio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //home: MyHomePage(),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => MyHomePage(),
        "/second": (BuildContext context) => SecondPage(),
      },
    );
  }
}
