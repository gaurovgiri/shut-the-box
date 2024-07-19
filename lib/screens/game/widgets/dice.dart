import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  final List<int>? diceList;

  const Dice({super.key, required this.diceList});

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward(from: 0.0);
  }

  @override
  void didUpdateWidget(Dice oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.diceList != widget.diceList) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.diceList!
                .map((diceValue) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Transform.rotate(
                        angle: _controller.value *
                            2 *
                            3.14159, // Rotate the dice image
                        child: Image.asset(
                          'assets/images/dice/Dice$diceValue.png',
                          width: 150,
                          height: 200,
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
