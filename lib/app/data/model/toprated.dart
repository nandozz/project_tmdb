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
