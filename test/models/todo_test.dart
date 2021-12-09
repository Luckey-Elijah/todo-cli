import 'package:test/test.dart';
import 'package:todo/todo.dart';

void main() {
  group('Todo', () {
    test('toMap', () {
      const exampleTodo = Todo(false, 'example');
      final matcher = equals(const {'isComplete': false, 'message': 'example'});
      final actual = exampleTodo.toMap();
      expect(actual, matcher);
    });

    test('fromMap', () {
      const map = {'isComplete': false, 'message': 'example'};
      final matcher = equals(const Todo(false, 'example'));
      final actual = Todo.fromMap(map);
      expect(actual, matcher);
    });

    test('toJson', () {
      const exampleTodo = Todo(false, 'example');
      final matcher = equals('{"isComplete":false,"message":"example"}');
      final actual = exampleTodo.toJson();
      expect(actual, matcher);
    });

    test('fromJson', () {
      const json = '{"isComplete":false,"message":"example"}';
      final matcher = equals(const Todo(false, 'example'));
      final actual = Todo.fromJson(json);
      expect(actual, matcher);
    });

    group('copyWith', () {
      test('isComplete', () {
        const exampleTodo = Todo(false, 'example');
        final actual = exampleTodo.copyWith(isComplete: true);
        final matcher = equals(const Todo(true, 'example'));
        expect(actual, matcher);
      });

      test('message', () {
        const exampleTodo = Todo(false, 'example');
        final actual = exampleTodo.copyWith(message: 'update');
        final matcher = equals(const Todo(false, 'update'));
        expect(actual, matcher);
      });
    });

    test('toString', () {
      const exampleTodo = Todo(false, 'example');
      final actual = exampleTodo.toString();
      final matcher = equals('Todo(isComplete: false, message: example)');
      expect(actual, matcher);
    });

    test('operator ==', () {
      expect(
        const Todo(false, 'example') == const Todo(false, 'example'),
        isTrue,
      );
      expect(const Todo(true, 'sample') == const Todo(true, 'sample'), isTrue);
      expect(const Todo(false, 'ex') == const Todo(false, 'ex'), isTrue);
      expect(const Todo(true, 'sample') == const Todo(true, 'sample'), isTrue);
      expect(const Todo(true, 'sample') == const Todo(true, 'sample'), isTrue);
      expect(const Todo(true, 'sample') == const Todo(true, 'sample'), isTrue);
    });

    test('hashCode', () {
      expect(
        const Todo(true, 'sample').hashCode,
        equals(const Todo(true, 'sample').hashCode),
      );

      expect(
        const Todo(true, 'sample').hashCode,
        equals(const Todo(true, 'sample').hashCode),
      );

      expect(
        const Todo(true, 'sample').hashCode,
        equals(const Todo(true, 'sample').hashCode),
      );
    });
  });
}
