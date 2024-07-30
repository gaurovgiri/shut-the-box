import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shut_the_box/controllers/gamecontroller.dart';
import 'package:shut_the_box/providers/dice_provider.dart';
import 'package:shut_the_box/providers/gamestate_provider.dart';
import 'package:shut_the_box/providers/piece_provider.dart';

import 'package:shut_the_box/shared/colors.dart';
import 'package:shut_the_box/shared/styles.dart';

class RollButton extends StatelessWidget {
  const RollButton({super.key});

  @override
  Widget build(BuildContext context) {
    final gameController = GameController();
    final gameStateProvider = context.watch<GameStateProvider>();
    final PieceProvider pieceProvider = context.read<PieceProvider>();
    final diceProvider = Provider.of<DiceProvider>(context, listen: false);
    return SizedBox(
      width: 160,
      height: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(20),
          shadowColor: WidgetStateProperty.all<Color>(Colors.black),
          backgroundColor: WidgetStateProperty.all<Color>(Palette.buttonColor),
        ),
        onPressed: () {
          if (gameStateProvider.rollState) {
            diceProvider.rollDice();
            gameStateProvider.setRollState(false);
          } else {
            if (gameController.validateGame(
                diceProvider.dice, pieceProvider.alreadySetPiece)) {
              if (gameController.validateMove(
                  diceProvider.dice,
                  pieceProvider.pieces.entries
                      .where((entry) =>
                          entry.value &&
                          !pieceProvider.alreadySetPiece.contains(entry.key))
                      .map((entry) => entry.key)
                      .toList())) {
                pieceProvider.setPiece();
                gameStateProvider.setRollState(true);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Not a valid move"),
                  ),
                );
              }
            } else {
              gameStateProvider.setGameOver(true);
            }
          }
        },
        child: gameStateProvider.rollState
            ? const Text(
                "Roll 🎲",
                style: Styles.title,
                textAlign: TextAlign.center,
              )
            : const Text(
                "Done ✅",
                style: Styles.title,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
