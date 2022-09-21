import 'package:flutter/material.dart';
import 'dart:math' as math;

class WindowOfOpportunity extends StatelessWidget {
  const WindowOfOpportunity({
    Key? key,
    required this.lightSource,
    required this.child,
  }) : super(key: key);

  final Offset lightSource;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final innerShadowWidth = lightSource.distance * 0.1;
    final portalShadowOffset = Offset.fromDirection(
      math.pi + lightSource.direction,
      innerShadowWidth,
    );
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: const [
            Color(0x661F1F1F),
            Colors.black,
          ],
          stops: [1 - innerShadowWidth, 1],
          center: Alignment(
            portalShadowOffset.dx,
            portalShadowOffset.dy,
          ),
        ),
      ),
      child: child,
    );
  }
}
