import 'package:flutter/material.dart';

class PieceProvider extends ChangeNotifier {
  late Map<int, bool> _pieces;
  late List<int> _alreadySetPiece;

  Map<int, bool> get pieces => Map.from(_pieces);
  List<int> get alreadySetPiece => _alreadySetPiece;

  PieceProvider() {
    _pieces = {
      for (var piece in List<int>.generate(9, (index) => index + 1))
        piece: false
    };
    _alreadySetPiece = [];
  }

  void togglePiece(int number) {
    if (!_alreadySetPiece.contains(number)) {
      _pieces[number] = !_pieces[number]!;
      notifyListeners();
    }
  }

  void setPiece() {
    _alreadySetPiece.addAll(_pieces.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key));
  }
}
