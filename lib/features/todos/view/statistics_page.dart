import 'package:dubmeio/features/todos/view/widgets/completed_todo_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
