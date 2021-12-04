import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:todo/models/models.dart';

class GenerateCommand extends Command<int> {
  GenerateCommand() {
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
      if (argResults == null) {
        path = Document.defaultPath;
      } else {
        path = argResults!['path'] as String? ?? Document.defaultPath;
      }
      return _generateDoc(path);
    } catch (e, s) {
      print('$e\n$s');
      return ExitCode.cantCreate.code;
    }
  }

  @override
  String get description => 'Start a new todo list.';

  @override
  String get name => 'generate';

  int _generateDoc(String path) {
    final jsonString = json.encode(
      Document.empty(path).toMap(),
    );
    final file = File(path);
    file.createSync();
    file.writeAsStringSync(jsonString);
    print('Created $path.');
    return ExitCode.success.code;
  }
}
