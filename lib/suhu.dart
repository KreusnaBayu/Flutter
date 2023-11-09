import 'package:flutter/material.dart';

class suhupage extends StatefulWidget {
  @override
  _SuhuConverterState createState() => _SuhuConverterState();
}

class _SuhuConverterState extends State<suhupage> {
  double inputSuhu = 0.0;
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  double hasilKonversi = 0.0;

  final units = ['Celsius', 'Fahrenheit'];

  Map<String, Map<String, double>> conversionTable = {
    'Celsius': {
      'Celsius': 1.0,
      'Fahrenheit': 1.8, // Konversi dari Celsius ke Fahrenheit

    },
    'Fahrenheit': {
      'Celsius': 5/9, // K
      'Fahrenheit': 1.0,

    },


  };

  void convertSuhu() {
    if (fromUnit != toUnit) {
      final conversionRate = conversionTable[fromUnit]![toUnit]!;
      setState(() {
        hasilKonversi = inputSuhu * conversionRate;
      });
    } else {
      setState(() {
        hasilKonversi = inputSuhu;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Konversi Suhu',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Masukan Suhu'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputSuhu = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton<String>(
                  value: fromUnit,
                  items: units.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                ),
                Icon(Icons.compare_arrows),
                DropdownButton<String>(
                  value: toUnit,
                  items: units.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: convertSuhu,
              child: Text('Konversikan'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                primary: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text('Hasil Konversi: $hasilKonversi $toUnit'),
          ],
        ),
      ),
    );
  }
}
