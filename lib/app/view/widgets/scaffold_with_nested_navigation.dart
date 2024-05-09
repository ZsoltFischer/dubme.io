import 'package:dubmeio_utils/dubmeio_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Creates a scaffold with nested navigation.
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('scaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: navigationShell.currentIndex,
          onTap: _goBranch,
          items: [
            BottomNavigationBarItem(
              label: 'Todos'.hardcoded,
              icon: const Icon(CupertinoIcons.calendar),
            ),
            BottomNavigationBarItem(
              label: 'Statistics'.hardcoded,
              icon: const Icon(Icons.fitness_center_outlined, weight: 10),
            ),
          ],
        ),
        tabBuilder: (_, __) => TapRegion(
          child: navigationShell,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ),
    );
  }
}
