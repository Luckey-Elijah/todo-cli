import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:mason/mason.dart';
import 'package:todo/todo.dart';

class AddCommand extends Command<int> {
  AddCommand(this.logger);
  final Logger logger;

  @override
  int run() {
    try {
      final doc = readDocument(Document.defaultPath);
      final todoMessage = logger.prompt('todo: ');
      final todos = doc.todos..add(Todo(false, todoMessage));
      final updated = doc.copyWith(todos: todos);
      File(doc.path).writeAsStringSync(updated.toJson());
      logger.success('Added todo: $todoMessage');
      return ExitCode.success.code;
    } on FileSystemException catch (e) {
      if (e.message != 'Cannot open file') rethrow;
      GenerateCommand(logger).run();
      return run();
    } catch (e, s) {
      logger.err('$e\n$s');
      return ExitCode.usage.code;
    }
  }

  @override
  String get description => 'add a todo';

  @override
  String get name => 'add';
}
