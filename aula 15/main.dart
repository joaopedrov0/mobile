import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}


class MMCCalculator extends StatefulWidget {
  const MMCCalculator({super.key});


  @override
  _CalculatorState createState() => _CalculatorState();
}


class _CalculatorState extends State<MMCCalculator> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';


  int _calculateMMC(int a, int b) {
    int max = a > b ? a : b;
    while (true) {
      if (max % a == 0 && max % b == 0) {
        return max;
      }
      max++;
    }
  }


  void _onCalculate() {
    int num1 = int.tryParse(_num1Controller.text) ?? 0;
    int num2 = int.tryParse(_num2Controller.text) ?? 0;
    if (num1 > 0 && num2 > 0) {
      int mmc = _calculateMMC(num1, num2);
      setState(() {
        _result = 'MMC de $num1 e $num2 é: $mmc';
      });
    } else {
      setState(() {
        _result = 'Por favor, insira números válidos.';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de MMC')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onCalculate,
              child: const Text('Calcular MMC'),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MMCCalculator())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('img/android-chrome-512x512.png')
          ],
        ),
      )
    );
    
  }
}