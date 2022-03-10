import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Calculadora de Gasto Calórico'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _name = 'Rafael';
  String _resultado = '';

  final myController = TextEditingController();
  final peso = TextEditingController();
  final altura = TextEditingController();
  final idade = TextEditingController();


  double _calculeGastoCalorico () {
    double valor = (66 + (13.7 * double.parse(peso.text)) + (5.0 * double.parse(altura.text)) - (6.8 * int.parse(idade.text)));
    setState(() {
      _resultado = 'Gasto Calorico: ' + valor.toString() + 'KCal';
    });
    return valor;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _changeName() {
    setState(() {
      _name = myController.text;
    });
  }

  void _onChange(String value) {
    setState(() {
      _name = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Image(
                    image: NetworkImage('https://amorpelacomida.com.br/wp-content/uploads/2016/08/comida-saudavel-150x150.jpg'),
                    width: 150,
                    height: 150,
                  ),
                )
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                    'Peso (KG)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 40),
                    child: TextField(
                      controller: peso,
                    ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                    'Altura (cm)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 40),
                    child: TextField(
                      controller: altura,
                    ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                    'Idade',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 60),
                    child: TextField(
                      controller: idade,
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(_resultado),
              ),
              // TextButton(
              //   style: ButtonStyle(
              //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              //     backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              //   ),
              //   onPressed: _calculeGastoCalorico,
              //   child: Text('Calcular'),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculeGastoCalorico,
        tooltip: 'Increment',
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
