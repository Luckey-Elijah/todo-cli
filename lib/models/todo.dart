import 'dart:convert';

import 'package:meta/meta.dart';

@immutable
class Todo {
  const Todo({
    required this.isComplete,
    required this.message,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      isComplete: map['isComplete'] as bool,
      message: map['message'] as String,
    );
  }

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  final bool isComplete;
  final String message;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isComplete': isComplete,
      'message': message,
    };
  }

  String toJson() => json.encode(toMap());

  Todo copyWith({
    bool? isComplete,
    String? message,
  }) {
    return Todo(
      isComplete: isComplete ?? this.isComplete,
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'Todo(isComplete: $isComplete, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.isComplete == isComplete &&
        other.message == message;
  }

  @override
  int get hashCode => isComplete.hashCode ^ message.hashCode;
}
