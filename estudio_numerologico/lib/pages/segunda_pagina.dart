import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecondPageArguments arguments = ModalRoute.of(context).settings.arguments;

    int longitudSinEspacios(String palabra) {
      int contador = 0;
      for (int i = 0; i < palabra.length; i++) {
        if (palabra.substring(i, i + 1) != " ") {
          contador++;
        }
      }
      return contador;
    }

    int sumaDeCifras(int numero) {
      int suma = 0;
      for (int i = 0; i < numero.toString().length; i++) {
        suma += int.parse(numero.toString().substring(i, i + 1));
      }
      return suma;
    }

    DateTime now = new DateTime.now();

    int ano = now.year;
    int mes = now.month;
    int dia = now.day;
    int hora = now.hour;
    int urgenciaInterior = sumaDeCifras(
        sumaDeCifras(sumaDeCifras(int.parse(arguments.dia))) +
            sumaDeCifras(sumaDeCifras(int.parse(arguments.mes))) +
            sumaDeCifras(sumaDeCifras(int.parse(arguments.year))));
    int longitudNombreCompleto = longitudSinEspacios(arguments.name) +
        longitudSinEspacios(arguments.lastName);
    int sumaLongitudNombreCompleto = sumaDeCifras(longitudNombreCompleto);
    int tonicaFundamental =
        sumaDeCifras(urgenciaInterior + sumaLongitudNombreCompleto);
    int tonicaDia = sumaDeCifras(tonicaFundamental + urgenciaInterior);
    int sumaFecha = sumaDeCifras(sumaDeCifras(sumaDeCifras(ano)) +
        sumaDeCifras(sumaDeCifras(mes)) +
        sumaDeCifras(sumaDeCifras(dia)));
    int acontecimientoDia =
        sumaDeCifras((sumaFecha + tonicaFundamental) + hora);
    int i = 0;
    var anios = [0, 0, 0, 0, 0];
    var numeros = [0, 0, 0, 0, 0];
    int anio = int.parse(arguments.year);
    while (i < 5) {
      int sumaAnio = sumaDeCifras(anio) + anio;
      int numeroReg = sumaDeCifras(sumaDeCifras(anio) + anio);
      anios[i] = sumaAnio;
      numeros[i] = numeroReg;
      i++;
      anio = sumaAnio;
    }
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Resultados", style: TextStyle(fontStyle: FontStyle.italic)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(arguments.name + " " + arguments.lastName),
            Text(arguments.dia + "/" + arguments.mes + "/" + arguments.year),
            Text("Urgencia interior: " + urgenciaInterior.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Tonica fundamental: " + tonicaFundamental.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Tonica del Dia: " + tonicaDia.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Acontecimiento del Dia: " + acontecimientoDia.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
                "Cabala del Año: " +
                    numeros[0].toString() +
                    " ->  " +
                    anios[0].toString() +
                    '\n' +
                    numeros[1].toString() +
                    " ->  " +
                    anios[1].toString() +
                    '\n' +
                    numeros[2].toString() +
                    " ->  " +
                    anios[2].toString() +
                    '\n' +
                    numeros[3].toString() +
                    " ->  " +
                    anios[3].toString() +
                    '\n' +
                    numeros[4].toString() +
                    " ->  " +
                    anios[4].toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class SecondPageArguments {
  String name;
  String lastName;
  String dia;
  String mes;
  String year;

  SecondPageArguments(
      {this.name, this.lastName, this.dia, this.mes, this.year});
}
