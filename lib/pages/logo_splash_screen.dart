import 'package:flutter/material.dart';

class LogoSplashScreen extends StatelessWidget {
  const LogoSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 62, 62),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/logoImage.png',
            ),
          )
        ],
      ),
    );
  }
}
