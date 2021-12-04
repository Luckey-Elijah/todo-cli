import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:mason/mason.dart';
import 'package:todo/todo.dart';

class CompleteCommand extends Command<int> {
  CompleteCommand(this.logger);

  final Logger logger;

  @override
  int run() {
    final doc = readDocument(Document.defaultPath);
    printTodos(doc, logger);

    if (doc.isFullyComplete) {
      logger.info('No todos remaining!');
      return ExitCode.success.code;
    }

    final input = logger.prompt('index: ');
    final selectedIndex = int.parse(input);
    doc.todos[selectedIndex] = doc.todos[selectedIndex].copyWith(
      isComplete: true,
    );
    printTodos(doc, logger);
    saveDocument(doc);
    return ExitCode.success.code;
  }

  @override
  String get description => 'mark a todo as complete';

  @override
  String get name => 'complete';
}
