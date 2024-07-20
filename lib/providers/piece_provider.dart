import 'package:flutter/material.dart';

class PieceProvider extends ChangeNotifier {
  late Map<int, bool> _pieces;

  Map<int, bool> get pieces => Map.from(_pieces);

  PieceProvider() {
    _pieces = {
      for (var piece in List<int>.generate(9, (index) => index + 1))
        piece: false
    };
  }

  void setPiece(List<int> numbers) {
    for (int num in numbers) {
      _pieces[num] = true;
    }
  }
}
