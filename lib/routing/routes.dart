import 'package:dubmeio/app/view/widgets/scaffold_with_nested_navigation.dart';
import 'package:dubmeio/features/todos/view/todos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// All the supported routes in the app.
/// By using an enum, we route by name using this syntax:
/// ```dart
/// context.goNamed(AppRoute.orders.name)
/// ```
enum AppRoute {
  todos,
  statistics,
  profile,
}

final _appShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'appShellNavigatorKey');

final _todosNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'todosNavigatorKey');

final _statisticsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'statisticsNavigatorKey');

class TodoAppRoutes {
  /// Page route for Todos.
  static final todos = GoRoute(
    path: '/',
    pageBuilder: (context, state) => const CupertinoPage(
      child: TodosPage(),
    ),
  );

  /// Statistics page route.
  static final statistics = GoRoute(
    path: '/statistics',
    pageBuilder: (context, state) => CupertinoPage(
      child: Container(
        color: Colors.red,
      ),
    ),
  );

  /// Profile page route. Not part of the main shell
  static final profile = GoRoute(
    path: '/profile',
    pageBuilder: (context, state) => const CupertinoPage(
      child: TodosPage(),
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
