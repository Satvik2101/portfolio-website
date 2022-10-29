import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:portfolio_website/widgets/rotating_circle.dart';

class ConcentricRotatingCircles extends StatelessWidget {
  const ConcentricRotatingCircles({
    Key? key,
    this.child,
    required this.outerDiameter,
    required this.innerDiameter,
  }) : super(key: key);
  final Widget? child;
  final double outerDiameter;
  final double innerDiameter;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: outerDiameter + 30,
      width: outerDiameter + 30,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotatingCircle(diameter: outerDiameter),
            RotatingCircle(
              diameter: innerDiameter,
              clockwise: false,
            ),
            // AutoSizeText(data)
            if (child != null)
              Container(
                height: innerDiameter - 30,
                width: innerDiameter - 30,
                alignment: Alignment.center,
                child: child!,
              ),
            // child,
          ],
        ),
      ),
    );
  }
}
