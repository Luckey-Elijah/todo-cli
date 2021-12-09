# Simple TODO CLI

[![style: very good analysis][vg_svg]][vg]

A simple command line todo build with Dart.

## Usage

### `--help`

```sh
$ dart bin/todo.dart -h
your cli todo manager

Usage: todo <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  add        add a todo
  complete   mark a todo as complete
  generate   Start a new todo list.
  remove     remove a todo from your list
  show       list all your todos
```

### `Usage: todo <command> [arguments]`

```sh
# initialize the list
$ dart bin/todo.dart generate
Created .todo-elijah.

# show items, but it is empty right now
$ dart bin/todo.dart show
No todos to show.

# add todo item
$ dart bin/todo.dart add
todo: My first todo

# list all items
$ dart bin/todo.dart show
- (0) [ ] My first todo

# mark a item as done
$ dart bin/todo.dart complete
- (0) [ ] My first todo
index: 0
- (0) [X] My first todo

# if you have no todos left to complete
$ dart bin/todo.dart complete
- (0) [X] My first todo!
No todos left!
```

[vg_svg]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[vg]: https://pub.dev/packages/very_good_analysis