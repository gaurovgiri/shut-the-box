import 'dart:math';
import 'package:flutter/material.dart';

class DiceProvider extends ChangeNotifier {
  final List<int> _dice = [0, 0];
  bool _diceChanged = false;

  List<int> get dice => _dice;
  bool get diceChanged => _diceChanged;

  void rollDice() {
    _dice.first = (Random().nextInt(6) + 1);
    _dice.last = (Random().nextInt(6) + 1);
    _diceChanged = true;
    notifyListeners();
  }

  void resetDiceChanged() {
    _diceChanged = false;
  }
}
