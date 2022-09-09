import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:portfolio_website/widgets/rotating_circle.dart';

class ConcentricRotatingCircles extends StatelessWidget {
  const ConcentricRotatingCircles({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        RotatingCircle(diameter: 300),
        RotatingCircle(
          diameter: 280,
          clockwise: false,
        ),
        if (child != null) child!,
        // child,
      ],
    );
  }
}
