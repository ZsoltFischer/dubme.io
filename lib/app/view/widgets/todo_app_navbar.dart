import 'package:dubmeio/routing/routes.dart';
import 'package:dubmeio_utils/dubmeio_utils.dart';
import 'package:dubmeio_widgets/dubmeio_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoAppNavbar extends StatelessWidget {
  const TodoAppNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      heroTag: 'todoPageHeroTag',
      largeTitle: const Text('Todo Page'),
      leading: context.isMobile
          ? IconButton(
              icon: const Icon(CupertinoIcons.person),
              onPressed: () => GoRouter.of(context).go(
                TodoAppRoutes.profile.path,
              ),
            )
          : null,
      trailing: context.isMobile
          ? IconButton(
              icon: const Icon(CupertinoIcons.settings),
              onPressed: () => GoRouter.of(context).go(
                Routes.authentication.path,
              ),
            )
          : null,
      border: Border.all(color: Colors.transparent),
    );
  }
}
