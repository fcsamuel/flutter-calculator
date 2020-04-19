import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCalc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculadora Simples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _soma = 0;
  double num1, num2;

  void _somaValores() {
    setState(() { // pra ocorrer a alteração tem que ter esse setState()
      _soma = num1 + num2;
    });
  }

  void _subtraiValores() {
    setState(() { // pra ocorrer a alteração tem que ter esse setState()
      _soma = num1 - num2;
    });
  }

  void _multiplicaValores() {
    setState(() { // pra ocorrer a alteração tem que ter esse setState()
      _soma = num1 * num2;
    });
  }

  void _divideValores() {
    setState(() { // pra ocorrer a alteração tem que ter esse setState()
      _soma = num1 / num2;
    });
  }

  @override
  Widget build(BuildContext context) { //Esse método é executado toda vez que o setState() é chamado
    return Scaffold(
      appBar: AppBar( //Pega o texto do build da app e seta como o texto do AppBar
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column( // Usado no layout, organiza os elementos horizontalmente
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Informe o 2º valor',
                      hintText: 'Aqui você informará o primeiro valor'
                  ),
                onChanged: (text) {
                  num1 = double.parse(text);
                }
                ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Informe o 1º valor',
                  hintText: 'Aqui você informará o primeiro valor',
              ),
              onChanged: (text) {
                num2 = double.parse(text);
              },
            ),
            Text ('A soma dos valores é'),
            Text ('$_soma'),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        closeManually: false,
        overlayOpacity: 0.0,
        child: Icon(Icons.exposure),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: 'Soma',
            onTap: () => _somaValores()
          ),
          SpeedDialChild(
              child: Icon(Icons.remove),
              label: 'Subtração',
              onTap: () => _subtraiValores()
          ),
          SpeedDialChild(
              child: Icon(Icons.clear),
              label: 'Multiplicação',
              onTap: () => _multiplicaValores()
          ),
          SpeedDialChild(
              child: Icon(Icons.pie_chart),
              label: 'Divisão',
              onTap: () => _divideValores()
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
