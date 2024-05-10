import 'package:dubmeio/features/todos/todos.dart';
import 'package:dubmeio/features/todos/view/widgets/todo_input_field.dart';
import 'package:dubmeio/features/todos/view/widgets/todo_list_tile.dart';
import 'package:dubmeio_widgets/dubmeio_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// A sliver that displays a list of [Todo]s.
class SliverTodoLists extends StatefulWidget {
  /// Creates a [SliverTodoLists].
  const SliverTodoLists({super.key});

  @override
  State<SliverTodoLists> createState() => _SliverTodoListsState();
}

class _SliverTodoListsState extends State<SliverTodoLists> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        return MultiSliver(
          children: [
            TodoInputField(controller: _controller),
            SliverPinnedHeaderSection(
              title: 'Active:',
              children: state.activeTodos
                  .map((todo) => TodoListTile(todo: todo))
                  .toList(),
            ),
            SliverPinnedHeaderSection(
              title: 'Completed:',
              children: state.completedTodos
                  .map((todo) => TodoListTile(todo: todo))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
