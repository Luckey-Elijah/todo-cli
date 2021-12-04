import 'dart:io';

import 'package:todo/todo.dart';

Document readDocument(String path) {
  final file = File(path);
  final json = file.readAsStringSync();
  return Document.fromJson(json);
}
