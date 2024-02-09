import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _alturaController = TextEditingController();
  var _pesoController = TextEditingController();
  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;
  double _altura = 0;
  double _peso = 0;
  String _imc = "";
  var _imcValuesMale = ["< 20", "20 - 24.9", "25 - 29.9", "30 - 40", "> 40"];
  var _imcValuesFemale = ["< 20", "20 - 23.9", "24 - 28.9", "29 - 37", "> 37"];

  void _limpiarSeleccion() {
    _altura = 0;
    _peso = 0;
    _isFemaleSelected = false;
    _isMaleSelected = false;
    _alturaController.clear();
    _pesoController.clear();
    _imc = "";
    setState(() {});
  }

  void _calcularImc() {
    _peso = double.parse(_pesoController.text);
    _altura = double.parse(_alturaController.text);
    _imc = (_peso / (_altura * _altura)).toStringAsFixed(2);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.help),
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _isMaleSelected = true;
                  _isFemaleSelected = false;
                  setState(() {});
                },
                onLongPress: () {},
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.male,
                          size: 64,
                          color: _isMaleSelected ? Colors.amber : Colors.white,
                        ),
                        Text("Masculino"),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _isFemaleSelected = true;
                  _isMaleSelected = false;
                  setState(() {});
                },
                onLongPress: () {},
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.female,
                          size: 64,
                          color:
                              _isFemaleSelected ? Colors.amber : Colors.white,
                        ),
                        Text("Femenino"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _alturaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ingrese altura (m)",
                prefixIcon: Icon(Icons.height),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _pesoController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.monitor_weight),
                border: OutlineInputBorder(),
                labelText: "Ingrese peso (Kg)",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MaterialButton(
              child: Text("Calcular"),
              color: Colors.orange,
              onPressed: () {
                _calcularImc();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MaterialButton(
              child: Text("Limpiar seleccion"),
              color: Colors.pink,
              onPressed: () {
                _limpiarSeleccion();
              },
            ),
          ),
          _imc != ""
              ? Center(
                  child: Text(
                    "IMC:$_imc",
                    style: TextStyle(fontSize: 48),
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }
}
