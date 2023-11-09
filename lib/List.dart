import 'package:flutter/material.dart';
import 'package:pengenalan/BMI.dart';
import 'package:pengenalan/Kalkulator.dart';
import 'package:pengenalan/konversimatauang.dart';
import 'package:pengenalan/suhu.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menonaktifkan banner debug
      home: Scaffold(
        body: ListView(
          children: [
            ListTile(
              title: Text("Kalkulator"),
              subtitle: Text("Tambah Kurang Kali Bagi"),
              leading: Icon(Icons.calculate),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => kalkulatorpage()));
              },
            ),
            Divider(color: Colors.black87),
            ListTile(
              title: Text("Convert"),
              subtitle: Text("Konversi Mata Uang"),
              leading: Icon(Icons.money),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => konversipage()));
              },
            ),
            Divider(color: Colors.black87),
            ListTile(
              title: Text("Temperature"),
              subtitle: Text("Konversi Suhu"),
              leading: Icon(Icons.search),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => suhupage()));
              },
            ),
            Divider(color: Colors.black87),
            ListTile(
              title: Text("BMI"),
              subtitle: Text("Body Mass Index"),
              leading: Icon(Icons.monitor_weight),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => bmipage()));
              },
            ),
            Divider(color: Colors.black87),
          ],
        ),
      ),
    );
  }
}
