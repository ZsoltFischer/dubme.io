import 'package:dubmeio/features/todos/todos.dart';
import 'package:dubmeio/features/todos/view/widgets/generate_dummy_data.dart';
import 'package:dubmeio/features/todos/view/widgets/todo_input_field.dart';
import 'package:dubmeio/features/todos/view/widgets/todo_list_tile.dart';
import 'package:dubmeio_widgets/dubmeio_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// A sliver that displays a list of [Todo]s.
class SliverTodoLists extends StatelessWidget {
  /// Creates a [SliverTodoLists].
  const SliverTodoLists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        return MultiSliver(
          children: [
            const TodoInputField(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const GenerateDummyData(),
                  Text(
                    'Use the generation to test the SliverPinnedHeaderSection',
                    style:
                        CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
                  ),
                ],
              ),
            ),
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
