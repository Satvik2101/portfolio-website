import 'dart:convert';

class Education {
  final String schoolName;
  final String degree;
  final DateTime start;
  final DateTime end;
  final double? gpa;
  final double? percentage;

  Education._(
    this.schoolName,
    this.degree,
    this.start,
    this.end,
    this.gpa,
    this.percentage,
  )   : assert(gpa != null || percentage != null,
            'Either gpa or percentage must be provided'),
        assert(gpa == null || percentage == null,
            'Only one of GPA and Percentage can be provided');

  // Education.withGPA({
  //   required this.schoolName,
  //   required this.degree,
  //   required this.start,
  //   required this.end,
  //   required this.gpa,
  // }) : percentage = null;

  // Education.withPercentage({
  //   required this.schoolName,
  //   required this.degree,
  //   required this.start,
  //   required this.end,
  //   required this.percentage,
  // }) : gpa = null;
  factory Education.fromMap(Map<String, dynamic> data) {
    double? gpa = data['gpa']?.toDouble();
    double? percentage = data['percentage']?.toDouble();
    try {
      return Education._(
        data['schoolName'],
        data['degree'],
        DateTime.parse(data['start']),
        DateTime.parse(data['end']),
        gpa,
        percentage,
      );
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
  factory Education.fromJson(String jsonData) {
    Map<String, dynamic> data = jsonDecode(jsonData);
    return Education.fromMap(data);
  }
}
