import 'package:flutter/material.dart';
import 'package:shut_the_box/shared/styles.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _countdownAnimation;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _countdownAnimation = IntTween(begin: 3, end: 0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isVisible = false;
          });
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _countdownAnimation,
        builder: (context, child) {
          return isVisible
              ? Text(
                  _countdownAnimation.value != 0
                      ? (_countdownAnimation.value).toString()
                      : "Start!",
                  style: Styles.title,
                )
              : const SizedBox();
        },
      ),
    );
  }
}
