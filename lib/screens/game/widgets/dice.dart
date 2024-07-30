import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shut_the_box/providers/dice_provider.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

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
  }

  @override
  void didUpdateWidget(Dice oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (context.read<DiceProvider>().diceChanged) {
      _controller.reset();
      _controller.forward(from: 0.0);
      context.read<DiceProvider>().resetDiceChanged();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiceProvider>(
      builder: (context, value, child) {
        if (value.dice.first == 0) {
          return const SizedBox();
        }
        _controller.reset();
        _controller.forward(from: 0.0);
        return SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: value.dice.map((diceValue) {
                  return Padding(
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
                  );
                }).toList(),
              );
            },
          ),
        );
      },
    );
  }
}
