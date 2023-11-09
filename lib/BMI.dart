import 'package:flutter/material.dart';



class bmipage extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<bmipage> {
  int _selectedIndex = 0;
  double height = 160.0;
  double weight = 60.0;
  double bmi = 0.0;
  String gender = 'Laki-laki';

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void calculateBMI() {
    setState(() {
      height = double.parse(heightController.text);
      weight = double.parse(weightController.text);
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.black,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Cek Body Mass Index (BMI)', // Judul di sini
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Jenis Kelamin',
              style: TextStyle(fontSize: 20.0),
            ),
            DropdownButton<String>(
              value: gender,
              items: <String>['Laki-laki', 'Perempuan']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
            ),
            Text(
              'Masukkan Tinggi (cm)',
              style: TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Tinggi (cm)',
              ),
            ),
            Text(
              'Masukkan Berat (kg)',
              style: TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Berat (kg)',
              ),
            ),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Hitung BMI'),
            ),
            Text(
              'BMI: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      )

    );
  }
}
