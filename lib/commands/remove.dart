import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:mason/mason.dart';

class RemoveCommand extends Command<int> {
  final Logger logger;

  RemoveCommand(this.logger);

  @override
  int run() {
    logger.info(name);
    return ExitCode.success.code;
  }

  @override
  String get description => 'remove a todo from your list';

  @override
  String get name => 'remove';
}
