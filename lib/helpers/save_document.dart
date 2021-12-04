import 'dart:io';

import 'package:todo/todo.dart';

void saveDocument(Document document) {
  return File(document.path).writeAsStringSync(document.toJson());
}
