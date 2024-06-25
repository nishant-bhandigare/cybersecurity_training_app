import 'package:flutter/material.dart';

class Gamezone extends StatelessWidget {
  const Gamezone({super.key});

  @override
  Widget build(BuildContext context) {
    return const PathUI();
  }
}

class PathUI extends StatelessWidget {
  const PathUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: CustomPaint(
            size:
                const Size(300, 600), // Specify the size of the custom painter
            painter: PathPainter(),
          ),
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.quadraticBezierTo(
        size.width, size.height * 0.25, size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(
        0, size.height * 0.75, size.width * 0.5, size.height);
    canvas.drawPath(path, paint);

    // Draw the levels
    final levelPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final levels = [
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.75, size.height * 0.25),
      Offset(size.width * 0.5, size.height * 0.5),
      Offset(size.width * 0.25, size.height * 0.75),
      Offset(size.width * 0.5, size.height),
    ];

    for (int i = 0; i < levels.length; i++) {
      canvas.drawCircle(levels[i], 30, levelPaint);

      if (i == 5) {
        // Draw gift icon at level 8
        const giftIcon = Icons.card_giftcard;
        final iconPainter = TextPainter(
          text: TextSpan(
            text: String.fromCharCode(giftIcon.codePoint),
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: giftIcon.fontFamily,
              color: Colors.white,
            ),
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        iconPainter.layout();
        iconPainter.paint(canvas, levels[i] - const Offset(15, 15));
      } else if (i == 3) {
        // Draw profile icon at level 4
        const profileIcon = Icons.person;
        final iconPainter = TextPainter(
          text: TextSpan(
            text: String.fromCharCode(profileIcon.codePoint),
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: profileIcon.fontFamily,
              color: Colors.white,
            ),
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        iconPainter.layout();
        iconPainter.paint(canvas, levels[i] - const Offset(15, 15));
      } else {
        // Draw level number
        textPainter.text = TextSpan(
          text: '${i + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
        textPainter.layout();
        textPainter.paint(canvas, levels[i] - const Offset(7, 10));
      }

      // Draw stars
      final starPainter = TextPainter(
        text: const TextSpan(
          text: '★ ★ ★',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      starPainter.layout();
      starPainter.paint(canvas, levels[i] + const Offset(-25, 35));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}