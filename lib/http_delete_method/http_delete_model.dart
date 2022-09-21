// To parse this JSON data, do
//
//     final httpDeleteModel = httpDeleteModelFromJson(jsonString);

import 'dart:convert';

HttpDeleteModel httpDeleteModelFromJson(String str) =>
    HttpDeleteModel.fromJson(json.decode(str));

String httpDeleteModelToJson(HttpDeleteModel data) =>
    json.encode(data.toJson());

class HttpDeleteModel {
  HttpDeleteModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory HttpDeleteModel.fromJson(Map<String, dynamic> json) =>
      HttpDeleteModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
