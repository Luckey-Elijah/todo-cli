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
