import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:portfolio_website/models/link.dart';

import 'personal_project.dart';
import 'work_experience/company_post.dart';
import 'work_experience/society_por.dart';

abstract class Experience {
  // final String companyName;
  // final String position;
  final List<String> bulletPoints;
  final DateTime start;
  final DateTime end;
  final List<Link> links;
  final List<String> skillsUsed;
  final String type;
  Experience({
    required this.bulletPoints,
    required this.start,
    required this.end,
    required this.links,
    required this.skillsUsed,
    required this.type,
  });
  factory Experience.fromMap(Map<String, dynamic> mp) {
    if (mp['type'] == null) {
      throw Exception('Type argument must be provided in Experience');
    }
    switch (mp['type']) {
      case 'SocietyPoR':
        return SocietyPoR.fromMap(mp);
      case 'CompanyPost':
        return CompanyPost.fromMap(mp);
      case 'PersonalProject':
        return PersonalProject.fromMap(mp);
      default:
        throw Exception('Invalid type argument in Experience ${mp['type']}');
    }
  }
  Widget getHighlightedWidget();
}
