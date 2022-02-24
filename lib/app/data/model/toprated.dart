// To parse this JSON data, do
//
//     final topRated = topRatedFromJson(jsonString);

import 'dart:convert';

TopRated topRatedFromJson(String str) => TopRated.fromJson(json.decode(str));

String topRatedToJson(TopRated data) => json.encode(data.toJson());

class TopRated {
  TopRated({
    required this.results,
  });

  List<Result> results;

  factory TopRated.fromJson(Map<String, dynamic> json) => TopRated(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.originalLanguage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });
  int? id;
  String? originalLanguage;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  double? voteAverage;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        originalLanguage: json["original_language"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_language": originalLanguage,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "vote_average": voteAverage,
      };
}
