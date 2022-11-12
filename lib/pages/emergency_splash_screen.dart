import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EmergencySplashScreen extends StatelessWidget {
  const EmergencySplashScreen(
      {super.key,
      this.size = 50,
      this.lowerPadding = 46,
      this.color = const Color.fromARGB(255, 230, 69, 69),
      this.loadingColor = Colors.white});

  final double size;
  final double lowerPadding;
  final Color color;
  final Color loadingColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, lowerPadding),
      color: color,
      child: SpinKitFadingCircle(
        color: loadingColor,
        size: size,
      ),
    );
  }
}
