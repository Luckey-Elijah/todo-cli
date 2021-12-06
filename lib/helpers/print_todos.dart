import 'package:mason/mason.dart';
import 'package:meta/meta.dart';
import 'package:todo/todo.dart';

/// Print all the todos in the document
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

/// Print a single todo object.
@visibleForTesting
void printOneTodo(Todo todo, int index, String padding, Logger logger) {
  final prefix = '- ($padding$index) [' + (todo.isComplete ? 'X' : ' ') + '] ';
  logger.info(prefix + todo.message);
}

/// Generate white space padding for an indexed value in a list.
@visibleForTesting
String getPadding(int index, int max) {
  final needsPadding = index < 10 && max > 10;
  return needsPadding ? ' ' : '';
}
