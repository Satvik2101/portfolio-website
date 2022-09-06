// import 'package:portfolio_website/models/experience/work_experience.dart';

import 'dart:convert';

import '../../link.dart';
import 'work_experience.dart';

class CompanyPost extends WorkExperience {
  CompanyPost({
    required super.companyName,
    required super.position,
    required super.bulletPoints,
    required super.start,
    required super.end,
    required super.links,
    required super.skillsUsed,
    // required super.type,
  }) : super(type: "CompanyPost");

  factory CompanyPost.fromMap(Map<String, dynamic> data) {
    try {
      return CompanyPost(
        companyName: data['companyName'],
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

  factory CompanyPost.fromJson(String jsonData) {
    Map<String, dynamic> data = jsonDecode(jsonData);
    return CompanyPost.fromMap(data);
  }
}
