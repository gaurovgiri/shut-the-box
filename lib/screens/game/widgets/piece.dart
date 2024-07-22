import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shut_the_box/providers/gamestate_provider.dart';
import 'package:shut_the_box/providers/piece_provider.dart';
import 'package:shut_the_box/shared/styles.dart';

class Piece extends StatelessWidget {
  final int number;

  const Piece({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    final gameStateProvider = context.watch<GameStateProvider>();
    return Consumer<PieceProvider>(builder: (context, value, child) {
      return InkWell(
        onTap: () {
          if (!gameStateProvider.rollState) {
            value.setPiece(number);
          }
        },
        child: Container(
          height: 100,
          width: 42,
          decoration: BoxDecoration(
              color: !value.pieces[number]!
                  ? const Color.fromARGB(255, 236, 202, 31)
                  : Colors.brown),
          child: Center(
              child: Text(
            number.toString(),
            style: Styles.title,
          )),
        ),
      );
    });
  }
}

class Pieces extends StatelessWidget {
  const Pieces({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(9, (index) => Piece(number: index + 1)));
  }
}
