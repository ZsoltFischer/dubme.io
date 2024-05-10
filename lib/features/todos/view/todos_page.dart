import 'package:dubmeio/app/view/widgets/widgets.dart';
import 'package:dubmeio/features/todos/view/widgets/sliver_todo_lists.dart';

import 'package:flutter/cupertino.dart';

// A page that displays the user's `todo` list.
class TodosPage extends StatelessWidget {
  /// Creates a [TodosPage].
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          TodoAppNavbar(),
          SliverTodoLists(),
        ],
      ),
    );
  }
}
