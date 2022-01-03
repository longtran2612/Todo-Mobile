import 'dart:convert';

class Task {
  Task({
    required this.name,
    required this.complete,
  });

  String name;
  bool complete;

  factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        name: json["name"] ?? "",
        complete: json["complete"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "complete": complete,
      };
}
