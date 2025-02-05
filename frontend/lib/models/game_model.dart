// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GameModel {
  final int id;
  final String title;
  final int year;
  final String imgUrl;
  final String shortDescription;
  final String? longDescription;
  final String? platforms;
  final String? genre;
  final double? score;

  GameModel({
    required this.id,
    required this.title,
    required this.year,
    required this.imgUrl,
    required this.shortDescription,
    this.longDescription,
    this.platforms,
    this.genre,
    this.score,
  });

  GameModel copyWith({
    int? id,
    String? title,
    int? year,
    String? imgUrl,
    String? shortDescription,
    String? longDescription,
    String? platforms,
    String? genre,
    double? score,
  }) {
    return GameModel(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      imgUrl: imgUrl ?? this.imgUrl,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      platforms: platforms ?? this.platforms,
      genre: genre ?? this.genre,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'year': year,
      'imgUrl': imgUrl,
      'shortDescription': shortDescription,
      'longDescription': longDescription,
      'platforms': platforms,
      'genre': genre,
      'score': score,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      id: map['id'] as int,
      title: map['title'] as String,
      year: map['year'] as int,
      imgUrl: map['imgUrl'] as String,
      shortDescription: map['shortDescription'] as String,
      longDescription: map['longDescription'] != null
          ? map['longDescription'] as String
          : null,
      platforms: map['platforms'] != null ? map['platforms'] as String : null,
      genre: map['genre'] != null ? map['genre'] as String : null,
      score: map['score'] != null ? map['score'] as double : null,
    );
  }

  @override
  String toString() {
    return 'GameModel(id: $id, title: $title, year: $year, imgUrl: $imgUrl, shortDescription: $shortDescription, longDescription: $longDescription, platforms: $platforms, genre: $genre, score: $score)';
  }

  @override
  bool operator ==(covariant GameModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.year == year &&
        other.imgUrl == imgUrl &&
        other.shortDescription == shortDescription &&
        other.longDescription == longDescription &&
        other.platforms == platforms &&
        other.genre == genre &&
        other.score == score;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        year.hashCode ^
        imgUrl.hashCode ^
        shortDescription.hashCode ^
        longDescription.hashCode ^
        platforms.hashCode ^
        genre.hashCode ^
        score.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
