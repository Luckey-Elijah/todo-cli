import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:mason/mason.dart';
import 'package:todo/todo.dart';

class TodoCommandRunner extends CommandRunner<int> {
  TodoCommandRunner({Logger? logger})
      : _logger = logger ?? Logger(),
        super('todo', 'your cli todo manager') {
    addCommand(AddCommand(_logger));
    addCommand(CompleteCommand(_logger));
    addCommand(RemoveCommand(_logger));
    addCommand(ShowCommand(_logger));
    addCommand(GenerateCommand(_logger));
  }

  final Logger _logger;

  @override
  Future<int?> run(Iterable<String> args) {
    try {
      return super.run(args);
    } on FileSystemException {
      return Future.value(ExitCode.usage.code);
    } catch (_) {
      rethrow;
    }
  }
}
