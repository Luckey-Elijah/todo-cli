import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:todo/todo.dart';

class ShowCommand extends Command<int> {
  @override
  int run() {
    try {
      final doc = readDocument(Document.defaultPath);
      printTodos(doc);
      return ExitCode.success.code;
    } on FileSystemException {
      print('Cannot find todos document.');
      return ExitCode.data.code;
    } catch (e, s) {
      print('$e\n$s');
      return ExitCode.usage.code;
    }
  }

  @override
  String get description => 'list all your todos';

  @override
  String get name => 'show';
}

void printTodos(Document doc) {
  if (doc.todos.isNotEmpty) {
    final length = doc.todos.length;
    for (var i = 0; i < length; i++) {
      final padding = _getPadding(i);
      _printTodo(doc.todos[i], i, padding);
    }
  } else {
    print('No todos to show.');
  }
}

void _printTodo(Todo todo, int index, String padding) {
  final prefix = '- ($padding$index) [' + (todo.isComplete ? 'X' : ' ') + '] ';
  print(prefix + todo.message);
}

String _getPadding(int scale) {
  if (scale < 10) {
    return '';
  }
  return ' ';
}
