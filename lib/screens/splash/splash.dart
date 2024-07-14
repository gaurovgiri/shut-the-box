import 'package:flutter/material.dart';
import 'package:shut_the_box/screens/home/home.dart';
import 'package:shut_the_box/shared/colors.dart';
import 'package:shut_the_box/shared/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), (() {}));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return const Home();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.background,
      body: Logo(),
    );
  }
}
