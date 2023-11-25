// To parse this JSON data, do
//
//     final districs = districsFromJson(jsonString);

import 'dart:convert';

Districs districsFromJson(String str) => Districs.fromJson(json.decode(str));

String districsToJson(Districs data) => json.encode(data.toJson());

class Districs {
  Districs({
    required this.id,
    required this.idKabupaten,
    required this.name,
  });

  String id;
  String idKabupaten;
  String name;

  factory Districs.fromJson(Map<String, dynamic> json) => Districs(
    id: json["id"],
    idKabupaten: json["id_kabupaten"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_kabupaten": idKabupaten,
    "name": name,
  };

  @override
  String toString() => name;
}
