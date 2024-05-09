import 'package:flutter/cupertino.dart';

class AuthRedirecter extends StatelessWidget {
  const AuthRedirecter({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;

    ///!TODO: Implement authentication redirections if applicable
    ///
    /// Using goRouter.refresh() is preferable to having a [refreshListenable]
    /// in the [GoRouter] instance because it will be deprecated soon.
    // return BlocListener<AuthenticationCubit, AuthenticationState>(
    //   listener: (context, state) {
    //     goRouter.refresh();
    //   },
    //   child: child,
    // );
  }
}
