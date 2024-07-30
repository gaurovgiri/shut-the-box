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
    bool isFirstDiceAvailable = !alreadySet.contains(dice.first);
    bool isLastDiceAvailable = !alreadySet.contains(dice.last);
    bool isSumAvailable = !alreadySet.contains(totalSum);

    if ((isFirstDiceAvailable && isLastDiceAvailable) || isSumAvailable) {
      return true;
    } else {
      return false;
    }
  }
}
