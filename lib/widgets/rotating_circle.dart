import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../helpers/painters/circular_spinner_painter.dart';

class CircularSpinner extends StatefulWidget {
  const CircularSpinner({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;
  // final void Function() onComplete;
  @override
  State<CircularSpinner> createState() => _CircularSpinnerState();
}

class _CircularSpinnerState extends State<CircularSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6280),
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
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: CustomPaint(
            painter: CircularSpinnerPainter(),
            size: Size(300, 300),
            child: widget.child,
            // child: AnimatingNumbers(),
          ),
        ),
      ],
    );
  }
}
