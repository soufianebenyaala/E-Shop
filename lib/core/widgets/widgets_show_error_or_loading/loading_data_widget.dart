import 'package:e_shop/core/assets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingDataWidget extends StatefulWidget {
  const LoadingDataWidget({
    super.key,
  });

  @override
  State<LoadingDataWidget> createState() => _LoadingDataWidgetState();
}

class _LoadingDataWidgetState extends State<LoadingDataWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 1.0, end: 1.2)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage(
                  Assets.mlkLogo,
                ),
              )),
              child: Transform.rotate(
                angle: _controller.status == AnimationStatus.forward
                    ? (math.pi * 2) * _controller.value
                    : -(math.pi * 2) * _controller.value,
                child: SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: CustomPaint(
                    painter: LoaderCanvas(radius: _animation.value),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LoaderCanvas extends CustomPainter {
  double radius;
  LoaderCanvas({required this.radius});

  @override
  Future<void> paint(Canvas canvas, Size size) async {
    Paint arc = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(
        Rect.fromCenter(
            center: center,
            width: size.width * radius,
            height: size.height * radius),
        math.pi / 4,
        math.pi / 2,
        false,
        arc);
    canvas.drawArc(
        Rect.fromCenter(
            center: center,
            width: size.width * radius,
            height: size.height * radius),
        -math.pi / 4,
        -math.pi / 2,
        false,
        arc);
  }

  @override
  bool shouldRepaint(LoaderCanvas oldDelegate) {
    return true;
  }
}
