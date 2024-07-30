class GameController {
  GameController();

  bool validateMove(List<int> dice, List<int> selectedPiece) {
    int totalSum = dice.reduce((a, b) => a + b);
    if (selectedPiece.isEmpty) return false;
    int selectedTotal = selectedPiece.reduce((a, b) => a + b);

    if (totalSum == selectedTotal) {
      return true;
    } else {
      return false;
    }
  }

  bool validateGame(List<int> dice, List<int> alreadySet) {
    int totalSum = dice.reduce((a, b) => a + b);
    if (alreadySet.contains(dice.first) &&
        alreadySet.contains(dice.last) &&
        alreadySet.contains(totalSum)) {
      return false;
    } else {
      return true;
    }
  }
}
