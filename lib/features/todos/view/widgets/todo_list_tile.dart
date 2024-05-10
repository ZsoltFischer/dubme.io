import 'package:dubmeio/features/todos/todos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A tile that represents a [Todo] in a list.
class TodoListTile extends StatelessWidget {
  /// Creates a [TodoListTile].
  const TodoListTile({
    required this.todo,
    super.key,
  });

  /// The [Todo] to display.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 8),
      child: Row(
        children: [
          /// Checkbox
          Flexible(
            child: CheckboxListTile.adaptive(
              title: Text(
                todo.title,
                style: todo.isCompleted
                    ? const TextStyle(decoration: TextDecoration.lineThrough)
                    : null,
              ),
              value: todo.isCompleted,
              onChanged: (_) =>
                  context.read<TodosBloc>().toggleTodo(todo: todo),
            ),
          ),

          /// Delete button
          IconButton(
            onPressed: () => context.read<TodosBloc>().deleteTodo(todo),
            icon: const Icon(CupertinoIcons.delete),
          ),
        ],
      ),
    );
  }
}
