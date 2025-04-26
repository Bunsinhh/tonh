import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tonh/screen/home_screen.dart';
// import 'home_screen.dart'; // We'll create HomeScreen separately

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (context) => const HomeScreen()),
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/image/tonh_logo.png'),
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
