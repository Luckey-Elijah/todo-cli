import 'dart:io';

import 'package:todo/todo.dart';

Document readDocument(String path) {
  final file = File(path);
  final json = file.readAsStringSync();
  return Document.fromJson(json);
}

void saveDocument(Document document) {
  return File(document.path).writeAsStringSync(document.toJson());
}
