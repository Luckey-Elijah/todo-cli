import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:mason/mason.dart';
import 'package:todo/models/models.dart';

class GenerateCommand extends Command<int> {
  final Logger logger;

  GenerateCommand(this.logger) {
    argParser.addOption(
      'path',
      help: 'set the path to create the document',
      abbr: 'p',
      defaultsTo: Document.defaultPath,
    );
  }

  @override
  int run() {
    try {
      String path;
      path = argResults == null
          ? Document.defaultPath
          : argResults!['path'] as String? ?? Document.defaultPath;
      return _generateDoc(path);
    } catch (e, s) {
      logger.err('$e\n$s');
      return ExitCode.cantCreate.code;
    }
  }

  @override
  String get description => 'Start a new todo list.';

  @override
  String get name => 'generate';

  int _generateDoc(String path) {
    final done = logger.progress('Creating $path.');
    final jsonString = json.encode(
      Document.empty(path).toMap(),
    );
    final file = File(path);
    file.createSync();
    file.writeAsStringSync(jsonString);

    done('Created $path.');
    return ExitCode.success.code;
  }
}
