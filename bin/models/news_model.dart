import 'dart:convert';

class NewsModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime dtPublication;
  final DateTime? dtAtualization;

  NewsModel(this.id, this.title, this.description, this.image,
      this.dtPublication, this.dtAtualization);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> map) {
    return NewsModel(
      map['id']?.toInt() ?? 0,
      map['title'] ?? '',
      map['description'] ?? '',
      map['image'] ?? '',
      DateTime.fromMicrosecondsSinceEpoch(map['dtPublication']),
      map['dtAtualization'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(map['dtAtualization'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());
}
