import 'package:flutter/material.dart';

class konversipage extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<konversipage> {
  double amount = 0.0;
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double convertedAmount = 0.0;

  final currencies = ['USD', 'EUR', 'GBP', 'JPY', 'CNY', 'IDR']; // Tambahkan 'IDR' (Rupiah)

  Map<String, double> exchangeRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.73,
    'JPY': 113.67,
    'CNY': 6.42,
    'IDR': 14143.75, // Tambahkan nilai tukar untuk IDR
  };

  void convertCurrency() {
    if (fromCurrency != toCurrency) {
      final fromRate = exchangeRates[fromCurrency];
      final toRate = exchangeRates[toCurrency];

      setState(() {
        convertedAmount = (amount / fromRate!) * toRate!;
      });
    } else {
      setState(() {
        convertedAmount = amount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Konversi Mata Uang', // Judul di sini
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah Uang'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton<String>(
                  value: fromCurrency,
                  items: currencies.map((currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      fromCurrency = value!;
                    });
                  },
                ),
                Icon(Icons.compare_arrows),
                DropdownButton<String>(
                  value: toCurrency,
                  items: currencies.map((currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      toCurrency = value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Konversi'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                primary: Colors.black, // Ganti dengan warna yang Anda inginkan
              ),
            ),
            SizedBox(height: 20),
            Text('Hasil Konversi: $convertedAmount $toCurrency'),
          ],
        ),
      ),
    );
  }
}


