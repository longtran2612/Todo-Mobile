import 'dart:convert';

import 'package:flutter/material.dart';

class Todo {
  String id;
  String title;
  String date;
  bool complete;

  Todo(
      {required this.id,
      required this.title,
      required this.date,
      required this.complete});

  factory Todo.fromRawJson(String str) => Todo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        complete: json['complete'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'complete': complete,
      };
}
