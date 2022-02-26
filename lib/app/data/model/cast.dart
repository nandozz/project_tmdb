// To parse this JSON data, do
//
//     final cast = castFromJson(jsonString);

import 'dart:convert';

Cast castFromJson(String str) => Cast.fromJson(json.decode(str));

String castToJson(Cast data) => json.encode(data.toJson());

class Cast {
  Cast({
    this.id,
    required this.cast,
  });

  int? id;
  List<CastElement> cast;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["id"],
        cast: List<CastElement>.from(
            json["cast"].map((x) => CastElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
      };
}

class CastElement {
  CastElement({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;

  factory CastElement.fromJson(Map<String, dynamic> json) => CastElement(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"],
        job: json["job"] == null ? null : json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": department,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "cast_id": castId == null ? null : castId,
        "character": character == null ? null : character,
        "credit_id": creditId,
        "order": order == null ? null : order,
        "department": department,
        "job": job == null ? null : job,
      };
}

// enum Department {
//   ACTING,
//   COSTUME_MAKE_UP,
//   PRODUCTION,
//   WRITING,
//   SOUND,
//   ART,
//   EDITING,
//   CAMERA,
//   DIRECTING,
//   CREW,
//   VISUAL_EFFECTS
// }

// final departmentValues = EnumValues({
//   "Acting": Department.ACTING,
//   "Art": Department.ART,
//   "Camera": Department.CAMERA,
//   "Costume & Make-Up": Department.COSTUME_MAKE_UP,
//   "Crew": Department.CREW,
//   "Directing": Department.DIRECTING,
//   "Editing": Department.EDITING,
//   "Production": Department.PRODUCTION,
//   "Sound": Department.SOUND,
//   "Visual Effects": Department.VISUAL_EFFECTS,
//   "Writing": Department.WRITING
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
