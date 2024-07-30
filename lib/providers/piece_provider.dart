import 'package:flutter/material.dart';
import 'package:shut_the_box/screens/game/widgets/piece.dart';

class PieceProvider extends ChangeNotifier {
  late Map<int, bool> _pieces;
  late List<int> _alreadySetPiece;

  Map<int, bool> get pieces => Map.from(_pieces);
  List<int> get alreadySetPiece => _alreadySetPiece;

  PieceProvider() {
    _pieces = {
      for (var piece
          in List<int>.generate(Pieces.numberOfPieces, (index) => index + 1))
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

  bool setPiece() {
    _alreadySetPiece.addAll(_pieces.entries
        .where((entry) => entry.value && !_alreadySetPiece.contains(entry.key))
        .map((entry) => entry.key));
    if (_alreadySetPiece.length == 9) {
      return true;
    } else {
      return false;
    }
  }

  void resetPieces() {
    _alreadySetPiece = [];
    for (var piece in _pieces.entries) {
      _pieces[piece.key] = false;
    }
  }
}
