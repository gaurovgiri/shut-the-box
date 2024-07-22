import 'package:flutter/material.dart';

class GameStateProvider extends ChangeNotifier {
  late bool _rollState;
  late bool _gameOver;
  late bool _won;
  late bool _gameStarted;

  bool get rollState => _rollState;
  bool get gameOver => _gameOver;
  bool get won => _won;
  bool get gameStarted => _gameStarted;

  GameStateProvider() {
    _rollState = true;
    _gameOver = false;
    _won = false;
    _gameStarted = false;
  }

  void setGameStart() {
    _gameStarted = true;
    notifyListeners();
  }

  void setRollState(bool isRolling) {
    _rollState = isRolling;
    notifyListeners();
  }

  void setWon(bool hasWon) {
    _won = hasWon;
    notifyListeners();
  }

  void setGameOver(bool hasGameOver) {
    _gameOver = hasGameOver;
    notifyListeners();
  }

  void resetGame() {
    _rollState = true;
    _gameOver = false;
    _won = false;
    _gameStarted = false;
    notifyListeners();
  }
}
