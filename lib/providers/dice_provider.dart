import 'dart:math';

import 'package:flutter/material.dart';

class DiceProvider extends ChangeNotifier {
  late List<int> _dice;

  List<int> get dice => _dice;

  void rollDice() {
    _dice.add(Random().nextInt(6) + 1);
    _dice.add(Random().nextInt(6) + 1);
  }
}
