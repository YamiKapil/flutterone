import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_one/adv_ui_8ball/components/prediction.dart';
import 'package:flutter_one/adv_ui_8ball/components/shadow_of_doubt.dart';
import 'package:flutter_one/adv_ui_8ball/components/sphere_of_destiny.dart';
import 'package:flutter_one/adv_ui_8ball/components/window_of_opportunity.dart';

class Magic8Ball extends StatefulWidget {
  const Magic8Ball({Key? key}) : super(key: key);

  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball>
    with SingleTickerProviderStateMixin {
  static const lightSource = Offset(0, -0.75);
  String prediction = 'The MAGIC\n8-Ball';
  static const restPosition = Offset(0, -0.15);
  Offset tapPosition = Offset.zero;

  void _update(Offset position, Size size) {
    Offset tapPosition = Offset(
      (2 * position.dx / size.width) - 1,
      (2 * position.dy / size.height) - 1,
    );
    if (tapPosition.distance > 0.85) {
      tapPosition = Offset.fromDirection(
        tapPosition.direction,
        0.85,
      );
    }
    setState(() => this.tapPosition = tapPosition);
  }

  late AnimationController controller;
  late Animation<double> animation;
  double wobble = 0.0;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        reverseDuration: const Duration(milliseconds: 1500));
    controller.addListener(() => setState(() => null));

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
      reverseCurve: Curves.elasticIn,
    );
    super.initState();
  }

  void _start(Offset offset, Size size) {
    controller.forward(from: 0);
    _update(offset, size);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _end() {
    final rand = math.Random();
    prediction = predictions[rand.nextInt(predictions.length)];
    wobble = rand.nextDouble() * (wobble.isNegative ? 0.5 : -0.5);
    controller.reverse(from: 1);
  }

  @override
  Widget build(BuildContext context) {
    // final windowPosition =
    //     tapPosition == Offset.zero ? restPosition : tapPosition;
    // final windowPosition =
    //     Offset.lerp(restPosition, tapPosition, controller.value)!;
    final windowPosition = Offset.lerp(
      restPosition,
      tapPosition,
      animation.value,
    )!;

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    // final windowPosition = restPosition;
    return Stack(
      children: [
        ShadowOfDoubt(
          diameter: size.shortestSide,
        ),
        GestureDetector(
          onPanUpdate: (details) => _update(
            details.localPosition,
            size,
          ),
          onPanStart: (details) => _start(
            details.localPosition,
            size,
          ),
          onPanEnd: (_) => _end(),
          child: SphereOfDestiny(
            diameter: size.shortestSide,
            lightSource: lightSource,
            child: Transform(
              origin: size.center(Offset.zero),
              transform: Matrix4.identity()
                ..translate(
                  windowPosition.dx * size.width / 2,
                  windowPosition.dy * size.height,
                )
                ..rotateZ(windowPosition.direction)
                ..rotateY(windowPosition.distance * math.pi / 2)
                ..rotateZ(-windowPosition.direction)
                ..scale(
                  0.5 - 0.15 * windowPosition.distance,
                ),
              child: WindowOfOpportunity(
                // lightSource: lightSource,
                // shadow cast should really point to the light source
                lightSource: lightSource - windowPosition,
                child: Opacity(
                  opacity: 1 - controller.value,
                  child: Transform.rotate(
                    angle: wobble,
                    child: Prediction(text: prediction),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
