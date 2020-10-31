import 'package:estudio_numerologico/pages/segunda_pagina.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nameValue;
  String lastnameValue;
  String diaValue, mesValue, yearValue;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Estudio Numerológico Gratuito",
                style: TextStyle(fontStyle: FontStyle.italic))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Text("Nombres y apellidos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(labelText: "Nombre(s):"),
                onSaved: (value) {
                  nameValue = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Apellido(s):"),
                onSaved: (value) {
                  lastnameValue = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  }
                },
              ),
              Text("\nFecha de nacimiento",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(labelText: "Día:"),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  diaValue = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  } else if (value.length > 2 || int.parse(value) < 1) {
                    return "Campo invalido";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Mes:"),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  mesValue = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  } else if (value.length > 2 ||
                      int.parse(value) < 1 ||
                      int.parse(value) > 12) {
                    return "Campo invalido";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Año:"),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  yearValue = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  } else if (value.length > 4 || int.parse(value) < 1) {
                    return "Campo invalido";
                  }
                },
              ),
              RaisedButton(
                child: Text("Calcular estudio"),
                onPressed: () {
                  _showSecondPage(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed("/second",
          arguments: SecondPageArguments(
            name: this.nameValue,
            lastName: this.lastnameValue,
            dia: this.diaValue,
            mes: this.mesValue,
            year: this.yearValue,
          ));
    }
  }
}

/*
import 'package:estudio_numerologico/pages/second_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameTextController;
  TextEditingController lastNameTextController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("Implementacion de campos de formulario sin el widget Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[

            TextField(
              decoration: InputDecoration(labelText: "Nombre:"),
              controller: nameTextController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Apellido:"),
              controller: lastNameTextController,
            ),

            RaisedButton(
              child: Text("Mostrar segunda pantalla"),
              onPressed: (){
                _showSecondPage(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context){
    Navigator.of(context).pushNamed("/second",
        arguments: SecondPageArguments(
            name: nameTextController.text,
            lastName: lastNameTextController.text));
  }

  @override
  void initState(){
    super.initState();
    nameTextController = TextEditingController();
    lastNameTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
    lastNameTextController.dispose();
  }
}
*/
