import 'package:flutter/cupertino.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// A section with a pinned header
class SliverPinnedHeaderSection extends StatelessWidget {
  /// Creates a new [SliverPinnedHeaderSection].
  const SliverPinnedHeaderSection({
    required this.title,
    required this.children,
    super.key,
  });

  /// The title of the section.
  final String title;

  /// The list .
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: [
        SliverPinnedHeader(
          child: Container(
            decoration: const BoxDecoration(
              color: CupertinoColors.systemGroupedBackground,
              border: Border(
                bottom: BorderSide(
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Text(
                title,
                style: CupertinoTheme.of(context).textTheme.actionTextStyle,
              ),
            ),
          ),
        ),
        SliverList.list(children: children),
      ],
    );
  }
}
