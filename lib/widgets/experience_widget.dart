import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'package:portfolio_website/models/experience/experience.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    Key? key,
    required this.exp,
  }) : super(key: key);
  final Experience exp;

  String getDateText(DateTime dateTime) {
    return DateFormat('MMM yyyy').format(dateTime);
    // return "${dateTime.month}/${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Column(
        children: [
          // Text(
          //   exp.type,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(getDateText(exp.start)),
              Text(getDateText(exp.end)),
            ],
          ),
          ...exp.skillsUsed.map((e) => Text(e)).toList(),
        ],
      ),
    );
  }
}
