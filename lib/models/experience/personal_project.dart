import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio_website/models/experience/experience.dart';

import '../link.dart';

class PersonalProject extends Experience {
  final String title;
  PersonalProject({
    required this.title,
    required super.bulletPoints,
    required super.start,
    required super.end,
    required super.links,
    required super.skillsUsed,
  }) : super(type: "PersonalProject");

  factory PersonalProject.fromMap(Map<String, dynamic> data) {
    try {
      return PersonalProject(
        title: data['title'],
        bulletPoints: List<String>.from(data['bulletPoints'] ?? []),
        start: DateTime.parse(data['start']),
        end: DateTime.parse(data['end']),
        links: List<Link>.from(
            (data['links'] ?? []).map((link) => Link.fromJson(link))),
        skillsUsed: List<String>.from(data['skillsUsed'] ?? []),
      );
    } on Exception catch (e) {
      print(e);
      rethrow;
      // TODO
    }
  }
  factory PersonalProject.fromJson(String jsonData) {
    Map<String, dynamic> data = jsonDecode(jsonData);
    return PersonalProject.fromMap(data);
  }

  @override
  Widget getHighlightedWidget() {
    return AutoSizeText(title);
  }
}
