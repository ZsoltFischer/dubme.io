import 'package:dubmeio/features/todos/view/widgets/sliver_todo_lists.dart';
import 'package:dubmeio/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// A page that displays the user's `todo` list.
class TodosPage extends StatelessWidget {
  /// Creates a [TodosPage].
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            heroTag: 'todoPageHeroTag',
            largeTitle: const Text('Todo Page'),
            leading: IconButton(
              icon: const Icon(CupertinoIcons.person),
              onPressed: () => GoRouter.of(context).go(
                TodoAppRoutes.profile.path,
              ),
            ),
            border: Border.all(color: Colors.transparent),
          ),
          const SliverTodoLists(),
        ],
      ),
    );
  }
}
