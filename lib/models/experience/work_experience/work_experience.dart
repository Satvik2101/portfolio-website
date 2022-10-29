import 'package:portfolio_website/models/experience/experience.dart';

abstract class WorkExperience extends Experience {
  final String entityName;
  final String position;
  WorkExperience({
    required this.entityName,
    required this.position,
    required super.bulletPoints,
    required super.start,
    required super.end,
    required super.links,
    required super.skillsUsed,
    required super.type,
  });

  // abstract Widget get
}
