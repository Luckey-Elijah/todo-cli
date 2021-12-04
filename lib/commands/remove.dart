import 'package:args/command_runner.dart';
import 'package:io/io.dart';

class RemoveCommand extends Command<int> {
  @override
  int run() {
    print(name);
    return ExitCode.success.code;
  }

  @override
  String get description => 'remove a todo from your list';

  @override
  String get name => 'remove';
}
