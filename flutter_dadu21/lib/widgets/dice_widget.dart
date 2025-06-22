import 'package:flutter/material.dart';
import 'dart:math';

class DiceWidget extends StatefulWidget {
  @override
  _DiceWidgetState createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int rollCount = 0;

  void _rollDices() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      rollCount++;
    });
  }

  void _resetDices() {
    setState(() {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
      rollCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = leftDiceNumber + rightDiceNumber;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Total Nilai Dadu: $total',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _rollDices,
              child: Image.asset('images/dice$leftDiceNumber.png', width: 100),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: _rollDices,
              child: Image.asset('images/dice$rightDiceNumber.png', width: 100),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Jumlah Lemparan: $rollCount',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _resetDices,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
