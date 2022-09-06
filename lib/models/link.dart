import 'dart:convert';

class Link {
  String title;
  String url;
  Link({
    required this.title,
    required this.url,
  });

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      title: map['title'] ?? '',
      url: map['url'] ?? '',
    );
  }

  factory Link.fromJson(String source) => Link.fromMap(json.decode(source));
}
