import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashAnimationScreen extends StatelessWidget {
  const SplashAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFFB9D1C3)),
        child: AnimatedSplashScreen(
            duration: 3000,
            splash: const Text(
              "LU GA",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  letterSpacing: 1,
                  fontFamily: "Noto Sans",
                  fontWeight: FontWeight.bold),
            ),
            nextScreen: const LoginScreen(),
            splashTransition: SplashTransition.sizeTransition,

            // pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.transparent),
      ),
    );
  }
}
