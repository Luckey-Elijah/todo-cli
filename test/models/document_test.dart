import 'package:test/test.dart';
import 'package:todo/todo.dart';

void main() {
  group('Document', () {
    test('defaultPath', () {
      const actual = Document.defaultPath;
      final matcher = equals('.todo-elijah');
      expect(actual, matcher);
    });

    test('isFullyComplete', () {
      const fullyCompleteTodos = <Todo>[
        Todo(true, 'message'),
        Todo(true, 'message'),
        Todo(true, 'message'),
      ];

      const incompleteTodos = <Todo>[
        Todo(true, 'message'),
        Todo(true, 'message'),
        Todo(false, 'message'),
      ];

      const completeDocument = Document(fullyCompleteTodos, 'path');
      const incompleteDocument = Document(incompleteTodos, 'path');
      const emptyDocument = Document([], 'path');

      expect(completeDocument.isFullyComplete, isTrue);
      expect(incompleteDocument.isFullyComplete, isFalse);
      expect(emptyDocument.isFullyComplete, isTrue);
    });

    test('toMap', () {
      const document = Document([
        Todo(true, 'message'),
        Todo(false, 'message'),
      ], 'example-path');

      final actual = document.toMap();
      final matcher = equals(const {
        'path': 'example-path',
        'todos': [
          {'isComplete': true, 'message': 'message'},
          {'isComplete': false, 'message': 'message'}
        ],
      });

      expect(actual, matcher);
    });

    test('empty', () {
      final actual = Document.empty('example-path');
      final matcher = equals(const Document([], 'example-path'));
      expect(actual, matcher);
    });

    test('fromMap', () {
      const map = {
        'path': 'example-path',
        'todos': [
          {'isComplete': true, 'message': 'message'},
          {'isComplete': false, 'message': 'message'}
        ],
      };

      final actual = Document.fromMap(map);
      final matcher = equals(
        const Document([
          Todo(true, 'message'),
          Todo(false, 'message'),
        ], 'example-path'),
      );
      expect(actual, matcher);
    });

    test('toJson', () {
      const document = Document([
        Todo(true, 'message'),
        Todo(false, 'message'),
      ], 'example-path');

      final actual = document.toJson();
      final matcher = equals('{"todos":[{"isComplete":true,'
          '"message":"message"},{"isComplete":false,"message":'
          '"message"}],"path":"example-path"}');

      expect(actual, matcher);
    });

    test('fromJson', () {
      const json = '{"todos":[{"isComplete":true,'
          '"message":"message"},{"isComplete":false,"message":'
          '"message"}],"path":"example-path"}';

      final actual = Document.fromJson(json);
      final matcher = equals(const Document([
        Todo(true, 'message'),
        Todo(false, 'message'),
      ], 'example-path'));

      expect(actual, matcher);
    });

    group('copyWith', () {
      test('todos', () {
        const document = Document([
          Todo(true, 'message'),
          Todo(false, 'message'),
        ], 'example-path');

        final actual = document.copyWith(todos: const [
          Todo(false, 'my todo replacer'),
        ]);
        final matcher = equals(const Document([
          Todo(false, 'my todo replacer'),
        ], 'example-path'));

        expect(actual, matcher);
      });

      test('path', () {
        const document = Document([
          Todo(true, 'message'),
          Todo(false, 'message'),
        ], 'example-path');

        final actual = document.copyWith(path: 'replacement');
        final matcher = equals(const Document([
          Todo(true, 'message'),
          Todo(false, 'message'),
        ], 'replacement'));

        expect(actual, matcher);
      });

      test('toString', () {
        const document = Document([
          Todo(true, 'message'),
          Todo(false, 'message'),
        ], 'example-path');

        final actual = document.toString();
        final matcher = equals(
          'Document(todos: [Todo(isComplete: true, message: message), '
          'Todo(isComplete: false, message: message)], path: example-path)',
        );

        expect(actual, matcher);
      });

      test('operator ==', () {
        expect(
          Document([
                Todo(false, 'message'),
                Todo(true, 'message'),
              ], 'example-path') ==
              Document([
                Todo(false, 'message'),
                Todo(true, 'message'),
              ], 'example-path'),
          isTrue,
        );
        expect(
          Document([
                Todo(true, 'message'),
                Todo(false, 'message'),
              ], 'example-path') ==
              Document([
                Todo(false, 'message'),
                Todo(true, 'message'),
              ], 'example-path'),
          isFalse,
        );
        expect(
          Document([Todo(false, 'message')], 'example-path') ==
              Document([Todo(false, 'message')], 'example-path'),
          isTrue,
        );
        expect(
          Document([], 'example-path') == Document([], 'example-path'),
          isTrue,
        );
      });

      test('hashCode', () {
        expect(
          const Document(
            [Todo(false, 'message'), Todo(true, 'message')],
            'example-path',
          ).hashCode,
          const Document(
            [Todo(false, 'message'), Todo(true, 'message')],
            'example-path',
          ).hashCode,
        );

        expect(
          const Document([Todo(false, 'message')], 'example-path').hashCode,
          const Document([Todo(false, 'message')], 'example-path').hashCode,
        );
        expect(
          const Document([], 'example-path').hashCode,
          const Document([], 'example-path').hashCode,
        );
      });
    });
  });
}
