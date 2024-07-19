import 'dart:math';

import 'package:flutter/material.dart';

import 'package:shut_the_box/shared/colors.dart';
import 'package:shut_the_box/shared/styles.dart';

class RollButton extends StatelessWidget {
  final Function(List<int>) onRoll;
  const RollButton({super.key, required this.onRoll});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(20),
          shadowColor: WidgetStateProperty.all<Color>(Colors.black),
          backgroundColor: WidgetStateProperty.all<Color>(Palette.buttonColor),
        ),
        onPressed: () {
          int result1 = rollDice();
          int result2 = rollDice();
          List<int> result = [result1, result2];
          onRoll(result);
        },
        child: const Text(
          "Roll 🎲",
          style: Styles.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

int rollDice() {
  return Random().nextInt(6) + 1; // Generates a random number between 1 and 6
}
