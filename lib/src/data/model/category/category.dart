// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<String> categoryFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoryToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
