import 'package:flutter/material.dart';
import 'dart:math' as math;

class ShadowOfDoubt extends StatelessWidget {
  const ShadowOfDoubt({
    Key? key,
    required this.diameter,
    // required this.lightSource,
  }) : super(key: key);

  final double diameter;
  // final Offset lightSource;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateX(math.pi / 2.1),
      origin: Offset(0, diameter),
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          // color: Colors.black,
          // neumorphic cheat changing color to show depth.
          // gradient: RadialGradient(
          //   colors: const [
          //     Colors.grey,
          //     Colors.black,
          //   ],
          //   // center: Alignment(lightSource.dx, lightSource.dy),
          // ),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Colors.grey.withOpacity(0.6),
            ),
          ],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
