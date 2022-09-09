import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'package:portfolio_website/models/experience/experience.dart';
import 'package:portfolio_website/widgets/concentric_rotating_circles.dart';
import 'package:portfolio_website/widgets/rotating_circle.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    Key? key,
    required this.exp,
  }) : super(key: key);
  final Experience exp;

  String getDateText(DateTime dateTime) {
    return "${DateFormat("MMM").format(dateTime)}'${DateFormat("yy").format(dateTime)}";
    // return "${dateTime.month}/${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          // CircularSpinner(
          //   child: Text(
          //     'HELLO',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          ConcentricRotatingCircles(
            child: Text(
              'HELLO',
              // style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            // color: Colors.black,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   exp.type,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(getDateText(exp.start)),
                    Text(' - '),
                    Text(getDateText(exp.end)),
                  ],
                ),
                // ...exp.skillsUsed.map((e) => Text(e)).toList(),
                ...exp.bulletPoints.map((e) => Text("\u2022 $e\n")).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
