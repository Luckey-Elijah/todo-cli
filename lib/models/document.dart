import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:todo/todo.dart';

@immutable
class Document {
  const Document(
    this.todos,
    this.path,
  );

  factory Document.fromJson(String source) =>
      Document.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Document.empty(String path) => Document(const [], path);

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      List<Todo>.from(
        (map['todos'] as List).map<Todo>(
          (dynamic x) => Todo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      map['path'] as String,
    );
  }

  static const defaultPath = '.todo-elijah';

  final List<Todo> todos;
  final String path;

  bool get isFullyComplete => !todos.any((todo) => !todo.isComplete);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todos': todos.map((x) => x.toMap()).toList(),
      'path': path,
    };
  }

  String toJson() => json.encode(toMap());

  Document copyWith({
    List<Todo>? todos,
    String? path,
  }) {
    return Document(
      todos ?? this.todos,
      path ?? this.path,
    );
  }

  @override
  String toString() => 'Document(todos: $todos, path: $path)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Document &&
        listEquals(other.todos, todos) &&
        other.path == path;
  }

  @override
  int get hashCode => todos.hashCode ^ path.hashCode;
}
