import 'package:flutter/material.dart';

class kalkulatorpage extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<kalkulatorpage> {
  TextEditingController data1Controller = TextEditingController();
  TextEditingController data2Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Kalkulator',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: data1Controller,
                decoration: InputDecoration(labelText: 'Data 1'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: data2Controller,
                decoration: InputDecoration(labelText: 'Data 2'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    buildListTile('Tambah', () {
                      calculate('+');
                    }),
                    buildListTile('Kurang', () {
                      calculate('-');
                    }),
                    buildListTile('Kali', () {
                      calculate('*');
                    }),
                    buildListTile('Bagi', () {
                      calculate('/');
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: resultController,
                decoration: InputDecoration(labelText: 'Hasil'),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculate(String operation) {
    double data1 = double.tryParse(data1Controller.text) ?? 0;
    double data2 = double.tryParse(data2Controller.text) ?? 0;
    double result = 0;

    if (operation == '+') {
      result = data1 + data2;
    } else if (operation == '-') {
      result = data1 - data2;
    } else if (operation == '*') {
      result = data1 * data2;
    } else if (operation == '/') {
      result = data1 / data2;
    }

    resultController.text = result.toString();
  }

  ListTile buildListTile(String title, VoidCallback onPressed) {
    return ListTile(
      title: Text(title),
      onTap: onPressed,
      tileColor: Colors.greenAccent.shade200,
    );
  }
}
