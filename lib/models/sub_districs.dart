// To parse this JSON data, do
//
//     final subDistrics = subDistricsFromJson(jsonString);

import 'dart:convert';

SubDistrics subDistricsFromJson(String str) => SubDistrics.fromJson(json.decode(str));

String subDistricsToJson(SubDistrics data) => json.encode(data.toJson());

class SubDistrics {
  SubDistrics({
    required this.id,
    required this.idKecamatan,
    required this.name,
  });

  String id;
  String idKecamatan;
  String name;

  factory SubDistrics.fromJson(Map<String, dynamic> json) => SubDistrics(
    id: json["id"],
    idKecamatan: json["id_kecamatan"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_kecamatan": idKecamatan,
    "name": name,
  };

@override
  String toString() => name;
}
