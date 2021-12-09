import 'package:test/test.dart';
import 'package:todo/todo.dart';

void main() {
  group('Todo', () {
    test('toMap', () {
      const exampleTodo = Todo(isComplete: false, message: 'example');
      final matcher = equals(const {'isComplete': false, 'message': 'example'});
      final actual = exampleTodo.toMap();
      expect(actual, matcher);
    });

    test('fromMap', () {
      const map = {'isComplete': false, 'message': 'example'};
      final matcher = equals(const Todo(isComplete: false, message: 'example'));
      final actual = Todo.fromMap(map);
      expect(actual, matcher);
    });

    test('toJson', () {
      const exampleTodo = Todo(isComplete: false, message: 'example');
      final matcher = equals('{"isComplete":false,"message":"example"}');
      final actual = exampleTodo.toJson();
      expect(actual, matcher);
    });

    test('fromJson', () {
      const json = '{"isComplete":false,"message":"example"}';
      final matcher = equals(const Todo(isComplete: false, message: 'example'));
      final actual = Todo.fromJson(json);
      expect(actual, matcher);
    });

    group('copyWith', () {
      test('isComplete', () {
        const exampleTodo = Todo(isComplete: false, message: 'example');
        final actual = exampleTodo.copyWith(isComplete: true);
        final matcher =
            equals(const Todo(isComplete: true, message: 'example'));
        expect(actual, matcher);
      });

      test('message', () {
        const exampleTodo = Todo(isComplete: false, message: 'example');
        final actual = exampleTodo.copyWith(message: 'update');
        final matcher =
            equals(const Todo(isComplete: false, message: 'update'));
        expect(actual, matcher);
      });
    });

    test('toString', () {
      const exampleTodo = Todo(isComplete: false, message: 'example');
      final actual = exampleTodo.toString();
      final matcher = equals(
        'Todo(isComplete: false, message: example)',
      );
      expect(actual, matcher);
    });

    test('operator ==', () {
      expect(
        const Todo(isComplete: false, message: 'example') ==
            const Todo(isComplete: false, message: 'example'),
        isTrue,
      );
      expect(
          const Todo(isComplete: true, message: 'sample') ==
              const Todo(isComplete: true, message: 'sample'),
          isTrue);
      expect(
          const Todo(isComplete: false, message: 'ex') ==
              const Todo(isComplete: false, message: 'ex'),
          isTrue);
      expect(
          const Todo(isComplete: true, message: 'sample') ==
              const Todo(isComplete: true, message: 'sample'),
          isTrue);
      expect(
          const Todo(isComplete: true, message: 'sample') ==
              const Todo(isComplete: true, message: 'sample'),
          isTrue);
      expect(
          const Todo(isComplete: true, message: 'sample') ==
              const Todo(isComplete: true, message: 'sample'),
          isTrue);
    });

    test('hashCode', () {
      expect(
        const Todo(isComplete: true, message: 'sample').hashCode,
        equals(const Todo(isComplete: true, message: 'sample').hashCode),
      );

      expect(
        const Todo(isComplete: true, message: 'sample').hashCode,
        equals(const Todo(isComplete: true, message: 'sample').hashCode),
      );

      expect(
        const Todo(isComplete: true, message: 'sample').hashCode,
        equals(const Todo(isComplete: true, message: 'sample').hashCode),
      );
    });
  });
}
