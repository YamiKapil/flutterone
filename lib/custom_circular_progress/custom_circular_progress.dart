import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCircularProgress extends StatefulWidget {
  const CustomCircularProgress({Key? key}) : super(key: key);

  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ProgressIndicatorButton(
          startAngle: -120,
          endAngle: 150,
        ),
      ),
    );
  }
}

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ProgressIndicatorButton extends StatelessWidget {
  const ProgressIndicatorButton({
    Key? key,
    required this.startAngle,
    required this.endAngle,
  }) : super(key: key);

  final int startAngle;
  final int endAngle;

  @override
  Widget build(BuildContext context) {
    const buttonSize = 80.0;
    const borderWidth = 2.0;

    return Stack(
      children: [
        Container(
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: borderWidth,
            ),
          ),
        ),
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: CustomPaint(
            painter: ProgressIndicatorPainter(
              width: borderWidth,
              startAngle: startAngle,
              sweepAngle: endAngle,
            ),
            child: Center(
              child: Container(
                width: buttonSize - 20.0,
                height: buttonSize - 20.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.done,
                    size: 30.0,
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

class ProgressIndicatorPainter extends CustomPainter {
  const ProgressIndicatorPainter({
    required this.width,
    required this.startAngle,
    required this.sweepAngle,
  }) : super();

  final double width;
  final int startAngle;
  final int sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final startAngleRad = startAngle * (math.pi / 180.0);
    final sweepAngleRad = sweepAngle * (math.pi / 180.0);
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (width / 2);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngleRad,
      sweepAngleRad,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
