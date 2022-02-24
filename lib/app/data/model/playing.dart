import 'dart:convert';

Playing playingFromJson(String str) => Playing.fromJson(json.decode(str));

String playingToJson(Playing data) => json.encode(data.toJson());

class Playing {
  Playing({
    required this.results,
  });

  List<Result> results;

  factory Playing.fromJson(Map<String, dynamic> json) => Playing(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  DateTime? maximum;
  DateTime? minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
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
