import 'dart:convert';

class Link {
  String title;
  String url;
  String? linkLogoUrl;
  Link({
    required this.title,
    required this.url,
    this.linkLogoUrl,
  });

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      linkLogoUrl: map['linkLogoUrl'],
    );
  }

  factory Link.fromJson(String source) => Link.fromMap(json.decode(source));
}
