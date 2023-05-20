import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashAnimationScreen extends StatelessWidget {
  const SplashAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: AnimatedSplashScreen(
            duration: 3000,
            splash: const Text(
              "LUICATE SHOP",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  letterSpacing: 1,
                  fontFamily: "Noto Sans",
                  fontWeight: FontWeight.bold),
            ),
            nextScreen: const LoginScreen(),
            splashTransition: SplashTransition.rotationTransition,
            backgroundColor: Colors.transparent),
      ),
    );
  }
}
