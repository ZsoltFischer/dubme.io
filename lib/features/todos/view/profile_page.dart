import 'package:dubmeio/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A page that displays the user profile.
class ProfilePage extends StatelessWidget {
  /// Creates a [ProfilePage].
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            heroTag: 'profilePageHeroTag',
            largeTitle: const Text('Profile Page'),
            leading: IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () => GoRouter.of(context).go(
                TodoAppRoutes.todos.path,
              ),
            ),
            border: Border.all(color: Colors.transparent),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Profile Page (routing test)',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .dateTimePickerTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
