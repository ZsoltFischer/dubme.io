import 'package:dubmeio/app/view/widgets/scaffold_with_nested_navigation.dart';
import 'package:dubmeio/features/todos/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _todosNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'todosNavigatorKey');

final _statisticsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'statisticsNavigatorKey');

/// All the supported routes in the app.
/// By using an enum, we route by name using this syntax:
/// ```dart
/// context.goNamed(AppRoute.todos.path)
/// ```
enum AppRoutes {
  todos(path: '/'),
  statistics(path: '/statistics'),
  profile(path: '/profile');

  const AppRoutes({required this.path});

  final String path;
}

class TodoAppRoutes {
  /// Page route for Todos.
  static final todos = GoRoute(
    path: AppRoutes.todos.path,
    pageBuilder: (context, state) => const CupertinoPage(
      child: TodosPage(),
    ),
  );

  /// Statistics page route.
  static final statistics = GoRoute(
    path: AppRoutes.statistics.path,
    pageBuilder: (context, state) =>
        const CupertinoPage(child: StatisticsPage()),
  );

  /// Profile page route. Not part of the main shell
  static final profile = GoRoute(
    path: AppRoutes.profile.path,
    pageBuilder: (context, state) => const CupertinoPage(
      child: ProfilePage(),
    ),
  );

  /// The main shell for the app.
  static final appShell = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return ScaffoldWithNestedNavigation(
        key: GlobalKey(),
        navigationShell: navigationShell,
      );
    },
    branches: [
      StatefulShellBranch(
        navigatorKey: _todosNavigatorKey,
        routes: [
          todos,
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _statisticsNavigatorKey,
        routes: [
          statistics,
        ],
      ),
    ],
  );
}
