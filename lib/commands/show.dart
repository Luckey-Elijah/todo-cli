import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:mason/mason.dart';
import 'package:todo/todo.dart';

class ShowCommand extends Command<int> {
  ShowCommand(this.logger);
  final Logger logger;

  @override
  int run() {
    try {
      final doc = readDocument(Document.defaultPath);
      printTodos(doc, logger);
      return ExitCode.success.code;
    } on FileSystemException {
      logger.err('Cannot find todos document.');
      return ExitCode.data.code;
    } catch (e, s) {
      logger.err('$e\n$s');
      return ExitCode.usage.code;
    }
  }

  @override
  String get description => 'list all your todos';

  @override
  String get name => 'show';
}

void printTodos(Document doc, Logger logger) {
  if (doc.todos.isNotEmpty) {
    final length = doc.todos.length;
    for (var i = 0; i < length; i++) {
      final padding = getPadding(i, length);
      printOneTodo(doc.todos[i], i, padding, logger);
    }
  } else {
    logger.info('No todos to show.');
  }
}

void printOneTodo(Todo todo, int index, String padding, Logger logger) {
  final prefix = '- ($padding$index) [' + (todo.isComplete ? 'X' : ' ') + '] ';
  logger.info(prefix + todo.message);
}

String getPadding(int index, int max) {
  if (index < 10 && max > 10) {
    return ' ';
  }
  return '';
}
