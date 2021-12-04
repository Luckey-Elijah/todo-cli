import 'dart:convert';

class Todo {
  const Todo(
    this.isComplete,
    this.message,
  );

  final bool isComplete;
  final String message;

  Map<String, dynamic> toMap() {
    return {
      'isComplete': isComplete,
      'message': message,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      map['isComplete'],
      map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  Todo copyWith({
    bool? isComplete,
    String? message,
  }) {
    return Todo(
      isComplete ?? this.isComplete,
      message ?? this.message,
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
