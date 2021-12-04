import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';
import 'package:io/io.dart';
import 'package:todo/todo.dart';

class AddCommand extends Command<int> {
  @override
  int run() {
    try {
      final doc = readDocument(Document.defaultPath);
      var todoMessage = ask('todo:', required: true);
      final todos = doc.todos..add(Todo(false, todoMessage));
      final updated = doc.copyWith(todos: todos);
      File(doc.path).writeAsStringSync(updated.toJson());
      return ExitCode.success.code;
    } on FileSystemException catch (e) {
      if (e.message != 'Cannot open file') rethrow;
      GenerateCommand().run();
      return run();
    } catch (e, s) {
      print('$e\n$s');
      return ExitCode.usage.code;
    }
  }

  @override
  String get description => 'add a todo';

  @override
  String get name => 'add';
}
