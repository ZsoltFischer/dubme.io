import 'package:dubmeio/routing/routes.dart';
import 'package:dubmeio_utils/dubmeio_utils.dart';
import 'package:dubmeio_widgets/dubmeio_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoAppNavigationRail extends StatelessWidget {
  const TodoAppNavigationRail({
    required this.goBranch,
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  final void Function(int) goBranch;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      indicatorColor: CupertinoColors.activeBlue.withOpacity(0.3),
      selectedIndex: navigationShell.currentIndex,
      groupAlignment: -1,
      onDestinationSelected: goBranch,
      labelType: NavigationRailLabelType.all,
      leading: IconButton(
        icon: const Icon(CupertinoIcons.person),
        onPressed: () => GoRouter.of(context).go(
          TodoAppRoutes.profile.path,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(CupertinoIcons.settings),
        onPressed: () => GoRouter.of(context).go(
          Routes.authentication.path,
        ),
      ),
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: const Icon(CupertinoIcons.list_bullet),
          label: Text('Todos'.hardcoded),
        ),
        NavigationRailDestination(
          icon: const Icon(CupertinoIcons.graph_square),
          selectedIcon: const Icon(CupertinoIcons.graph_square_fill),
          label: Text('Progress'.hardcoded),
        ),
      ],
    );
  }
}
