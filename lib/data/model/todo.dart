import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';

List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  String id;
  String title;
  DateTime date;
  bool complete;
  String note;
  String userphone;
  List<Task>? tasks;

  Todo(
      {required this.id,
      required this.title,
      required this.date,
      required this.complete,
      required this.note,
      this.tasks,
      required this.userphone});

  factory Todo.fromRawJson(String str) => Todo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'] ?? "",
        title: json['title'] ?? "",
        date: DateTime.parse(json["date"]),
        complete: json['complete'] ?? false,
        note: json['note'] ?? "",
        tasks: json['tasks'] == null
            ? null
            : List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
        userphone: json['userphone'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'complete': complete,
        'note': note,
        'tasks': tasks == null
            ? null
            : List<dynamic>.from(tasks!.map((x) => x.toJson())),
        'userphone': userphone,
      };
}

class TodoList {
  List<Todo>? todos;
  TodoList({this.todos});
  factory TodoList.fromRawJson(String str) =>
      TodoList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
        todos: json['todos'] == null
            ? null
            : List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'todos': todos == null
            ? null
            : List<dynamic>.from(todos!.map((x) => x.toJson())),
      };
}
