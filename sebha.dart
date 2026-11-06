
import 'dart:math';
import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<Sebha> {
  int counter = 0;


  void incrementCounter() {
    setState(() {
      counter++;
    });
  }


  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              child: Stack(
                children: [

                  Positioned.fill(
                    child: Image.asset(
                      'assets/sebha_bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.65),
                    ),
                  ),

                  Column(
                    children: [
                      const SizedBox(height: 65),
                      Image.asset('assets/logo.png'),

                      const SizedBox(height: 35),
                      const Text(
                        'سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),


                      const Spacer(),


                      LayoutBuilder(
                        builder: (context, constraints) {

                          double size = min(
                            constraints.maxWidth - 20,
                            constraints.maxHeight,
                          );

                          return GestureDetector(
                            onTap: incrementCounter,

                            child: SizedBox(
                              width: size,
                              height: size,

                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomPaint(
                                    size: Size(size, size),
                                    painter: BeadsPainter(),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      const Text(
                                        'سبحان الله',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 20),

                                      Text(
                                        '$counter',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 27,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      const Spacer(),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            bottom: 15,
                          ),

                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 60,
            color: const Color(0xFFE8C27D),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [

                Icon(Icons.book,
                    color: Colors.black87),

                Icon(Icons.menu_book_outlined,
                    color: Colors.black87),

                Icon(Icons.gesture,
                    color: Colors.white),

                Icon(Icons.radio,
                    color: Colors.black87),

                Icon(Icons.bar_chart,
                    color: Colors.black87),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BeadsPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final center = Offset(
      size.width / 2,
      size.height / 2,
    );


    final radius = size.width * 0.42;

    const int beadsCount = 28;

    for (int i = 0; i < beadsCount; i++) {


      double angle =
          (2 * pi * i / beadsCount) - pi / 2;

      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);

      double beadRadius = size.width * 0.047;

      final paint = Paint()
        ..shader = const RadialGradient(
          colors: [
            Color(0xFFFFE5A0),
            Color(0xFFE6B85C),
            Color(0xFFB77D27),
          ],
        ).createShader(
          Rect.fromCircle(
            center: Offset(x, y),
            radius: beadRadius,
          ),
        );

      canvas.drawCircle(
        Offset(x + 2, y + 3),
        beadRadius,
        Paint()
          ..color = Colors.black54
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            3,
          ),
      );

      canvas.drawCircle(
        Offset(x, y),
        beadRadius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant BeadsPainter oldDelegate) {
    return false;
  }
}
