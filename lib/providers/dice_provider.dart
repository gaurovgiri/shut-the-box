import 'dart:math';

import 'package:flutter/material.dart';

class DiceProvider extends ChangeNotifier {
  final List<int> _dice = [1, 1];

  List<int> get dice => _dice;

  void rollDice() {
    _dice.first = (Random().nextInt(6) + 1);
    _dice.last = (Random().nextInt(6) + 1);
  }
}
