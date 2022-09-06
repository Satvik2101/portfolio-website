import 'dart:convert';

import 'package:portfolio_website/models/education.dart';
import 'package:portfolio_website/models/experience/experience.dart';
// / import 'package:portfolio_website/models/work_experience.dart';

import 'link.dart';

class Person {
  String name;
  String title;
  String email;
  String phone;
  String location;
  String about;
  String profilePictureUrl;
  List<Experience> experiences;
  List<Education> education;
  List<String> technicalSkills;
  List<String> achievements;
  List<Link> links;
  Person({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.location,
    required this.about,
    required this.profilePictureUrl,
    required this.achievements,
    required this.technicalSkills,
    required this.education,
    required this.experiences,
    required this.links,
  });

  factory Person.fromMap(Map<String, dynamic> map) {
    try {
      return Person(
        name: map['name'] ?? '',
        title: map['title'] ?? '',
        email: map['email'] ?? '',
        phone: map['phone'] ?? '',
        location: map['location'] ?? '',
        about: map['about'] ?? '',
        profilePictureUrl: map['profilePictureUrl'] ?? '',
        experiences: List<Experience>.from(
            map['experiences']?.map((x) => Experience.fromMap(x))),
        education: List<Education>.from(
            map['education']?.map((x) => Education.fromMap(x))),
        technicalSkills: List<String>.from(map['technicalSkills'] ?? []),
        achievements: List<String>.from(map['achievements'] ?? []),
        links: List<Link>.from(map['links']?.map((x) => Link.fromMap(x))),
      );
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));
}
