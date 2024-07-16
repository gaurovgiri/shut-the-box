import 'package:flutter/material.dart';
import 'package:shut_the_box/shared/styles.dart';

class Piece extends StatefulWidget {
  final int number;

  Color pieceColor = Color.fromARGB(255, 236, 202, 31);
  bool selected = false;

  Piece({super.key, required this.number});

  @override
  State<Piece> createState() => _PieceState();
}

class _PieceState extends State<Piece> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.pieceColor = widget.selected
              ? const Color.fromARGB(255, 236, 202, 31)
              : Colors.brown;
          widget.selected = !widget.selected;
        });
      },
      child: Container(
        height: 100,
        width: 42,
        decoration: BoxDecoration(color: widget.pieceColor),
        child: Center(
            child: Text(
          widget.number.toString(),
          style: Styles.title,
        )),
      ),
    );
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
