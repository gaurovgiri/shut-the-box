import 'package:flutter/material.dart';
import 'package:shut_the_box/shared/styles.dart';

class Logo extends StatefulWidget {
  final bool rotate;
  const Logo({super.key, required this.rotate});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the rotation
      vsync: this,
    );

    if (widget.rotate) {
      _controller.forward();
    } else {
      _controller.stop();
    }

    // This will start the rotation effect
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            child: Image.asset("assets/images/dice_logo.png"),
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value *
                    2 *
                    3.141592653589793238, // Rotate full circle
                child: child,
              );
            },
          ),
          const Text(
            "Shut The Box!",
            style: Styles.title,
          ),
        ],
      ),
    );
  }
}
