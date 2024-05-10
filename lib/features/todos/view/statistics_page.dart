import 'package:dubmeio/features/todos/bloc/todos_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A page that displays statistics about the 'todos'.
class StatisticsPage extends StatelessWidget {
  /// Creates a [StatisticsPage].
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            heroTag: 'statsoPageHeroTag',
            largeTitle: const Text('Statistics Page'),
            trailing: const Icon(CupertinoIcons.add_circled),
            border: Border.all(color: Colors.transparent),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: CompletedTodoCounter(),
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedTodoCounter extends StatelessWidget {
  const CompletedTodoCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Text(
            'Completed TODOs:',
            style: CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle,
          ),
        ),
        BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            return Text(
              '${state.completedTodos.length}/${state.todos.length}',
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navLargeTitleTextStyle
                  .copyWith(color: CupertinoColors.systemBlue),
            );
          },
        ),
      ],
    );
  }
}
