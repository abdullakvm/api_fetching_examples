// To parse this JSON data, do
//
//     final todoListResModel = todoListResModelFromJson(jsonString);

import 'dart:convert';

TodoListResModel todoListResModelFromJson(String str) =>
    TodoListResModel.fromJson(json.decode(str));

String todoListResModelToJson(TodoListResModel data) =>
    json.encode(data.toJson());

class TodoListResModel {
  List<Todo>? todos;
  num? total;
  num? skip;
  num? limit;

  TodoListResModel({this.todos, this.total, this.skip, this.limit});

  factory TodoListResModel.fromJson(Map<String, dynamic> json) =>
      TodoListResModel(
        todos: json["todos"] == null
            ? []
            : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
    "todos": todos == null
        ? []
        : List<dynamic>.from(todos!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Todo {
  num? id;
  String? todo;
  bool? completed;
  num? userId;

  Todo({this.id, this.todo, this.completed, this.userId});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    todo: json["todo"],
    completed: json["completed"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
  };
}
