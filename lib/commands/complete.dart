import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';
import 'package:io/io.dart';
import 'package:todo/todo.dart';

class CompleteCommand extends Command<int> {
  @override
  int run() {
    final doc = readDocument(Document.defaultPath);
    printTodos(doc);

    if (doc.isFullyComplete) {
      print('No todos left!');
      return ExitCode.success.code;
    }

    final input = ask(
      'index:',
      required: true,
      validator: const _AskPositiveIntWithMaxValue(),
    );
    final selectedIndex = int.parse(input);
    doc.todos[selectedIndex] = doc.todos[selectedIndex].copyWith(
      isComplete: true,
    );
    printTodos(doc);
    saveDocument(doc);
    return ExitCode.success.code;
  }

  @override
  String get description => 'mark a todo as complete';

  @override
  String get name => 'complete';
}

class _AskPositiveIntWithMaxValue extends AskValidator {
  const _AskPositiveIntWithMaxValue() : super();

  @override
  String validate(String line) {
    final trimmedInput = line.trim();
    if (!RegExp(r'^(?:-?(?:0|[0-9][0-9]*))$').hasMatch(trimmedInput)) {
      throw AskValidatorException(red('Invalid positive integer.'));
    }
    return trimmedInput;
  }
}
