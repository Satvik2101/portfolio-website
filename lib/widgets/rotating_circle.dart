import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../helpers/painters/circular_spinner_painter.dart';

class RotatingCircle extends StatefulWidget {
  const RotatingCircle({
    Key? key,
    this.child,
    required this.diameter,
    this.clockwise = true,
  }) : super(key: key);
  final Widget? child;
  final double diameter;
  final bool clockwise;

  // final void Function() onComplete;
  @override
  State<RotatingCircle> createState() => _RotatingCircleState();
}

class _RotatingCircleState extends State<RotatingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50000),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // print(_controller.value * 360);
            return Transform.rotate(
              angle: widget.clockwise
                  ? _controller.value * 2 * math.pi
                  : -_controller.value * 2 * math.pi,
              child: CustomPaint(
                painter: CircularSpinnerPainter(),
                size: Size(widget.diameter, widget.diameter),
                child: Container(
                  width: widget.diameter,
                  height: widget.diameter,
                  alignment: Alignment.center,
                  child: widget.child,
                ),
              ),
            );
          },
          child: widget.child,
        ),
      ],
    );
  }
}
