// To parse this JSON data, do
//
//     final topRated = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.results,
  });

  List<Result> results;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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
    this.overview,
    this.posterPath,
    this.title,
    this.voteAverage,
  });
  int? id;
  String? overview;
  String? posterPath;
  String? title;
  double? voteAverage;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "overview": overview,
        "poster_path": posterPath,
        "title": title,
        "vote_average": voteAverage,
      };
}
