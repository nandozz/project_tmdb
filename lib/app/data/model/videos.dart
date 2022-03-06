// To parse this JSON data, do
//
//     final videos = videosFromJson(jsonString);

import 'dart:convert';

Videos videosFromJson(String str) => Videos.fromJson(json.decode(str));

String videosToJson(Videos data) => json.encode(data.toJson());

class Videos {
  Videos({
    required this.id,
    required this.results,
  });

  int id;
  List<Result> results;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        id: json["id"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.key,
  });

  String? name;
  String? key;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
      };
}
