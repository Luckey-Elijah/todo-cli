import 'package:io/ansi.dart';
import 'package:mason/mason.dart';

extension LoggerX on Logger {
  /// Styles a prompt accept: `Y`, `y`, and `n`.
  ///
  /// Example:
  /// ```dart
  /// logger.yynPrompt('Do you accept the terms and conditions?');
  /// ```
  /// ```shell
  /// $ show_prompt
  /// ...
  /// Do you accept the terms and conditions? (Yyn) n
  /// ...
  /// ```
  InputRule yynPrompt([String message = '']) {
    return prompt(
      yellow.wrap(
        '$message ' + styleBold.wrap('(Yyn)')! + ' ',
      ),
    ).asInputRule;
  }
}

enum InputRule {
  yesAlways,
  yesOnce,
  no,
}

extension StringX on String {
  /// Converts [this] to one of below [InputRule]s. Defaults to
  /// [InputRule.no].
  /// ```dart
  /// {
  ///   'Y': InputRule.yesAlways,
  ///   'y': InputRule.yesOnce,
  ///   'n': InputRule.no,
  /// }
  /// ```
  InputRule get asInputRule => _inputRuleMap[this] ?? InputRule.no;

  static const _inputRuleMap = <String, InputRule>{
    'Y': InputRule.yesAlways,
    'y': InputRule.yesOnce,
    'n': InputRule.no,
  };
}
