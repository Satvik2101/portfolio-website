// import 'package:portfolio_website/models/experience/work_experience.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../link.dart';
import 'work_experience.dart';

class SocietyPoR extends WorkExperience {
  SocietyPoR({
    required super.entityName,
    required super.position,
    required super.bulletPoints,
    required super.start,
    required super.end,
    required super.links,
    required super.skillsUsed,
  }) : super(type: "SocietyPoR");

  String get societyName => entityName;
  factory SocietyPoR.fromMap(Map<String, dynamic> data) {
    try {
      return SocietyPoR(
        entityName: data['entityName'],
        position: data['position'],
        bulletPoints: List<String>.from(data['bulletPoints'] ?? []),
        start: DateTime.parse(data['start']),
        end: DateTime.parse(data['end']),
        links: List<Link>.from(
            (data['links']?.map((link) => Link.fromJson(link))) ?? []),
        skillsUsed: List<String>.from(data['skillsUsed'] ?? []),
      );
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  factory SocietyPoR.fromJson(String jsonData) {
    Map<String, dynamic> data = jsonDecode(jsonData);
    return SocietyPoR.fromMap(data);
  }

  @override
  Widget getHighlightedWidget() {
    // TODO: implement getHighlightedWidget
    return Text(entityName);
    // throw UnimplementedError();
  }
}
