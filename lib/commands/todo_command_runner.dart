import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:todo/todo.dart';

class TodoCommandRunner extends CommandRunner<int> {
  TodoCommandRunner() : super('todo', 'your cli todo manager') {
    addCommand(AddCommand());
    addCommand(CompleteCommand());
    addCommand(RemoveCommand());
    addCommand(ShowCommand());
    addCommand(GenerateCommand());
  }
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
