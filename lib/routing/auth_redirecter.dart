import 'package:flutter/cupertino.dart';

class AuthRedirecter extends StatelessWidget {
  const AuthRedirecter({
    required this.child,
    // required this.goRouter,
    super.key,
  });

  final Widget child;

  // final GoRouter goRouter;

  @override
  Widget build(BuildContext context) {
    return child;

    /// Example usage of the [BlocListener] to refresh the [GoRouter] instance.
    ///
    /// Using goRouter.refresh() is preferable to having a [refreshListenable]
    /// in the [GoRouter] instance because that will be deprecated soon.
    ///
    // return BlocListener<AuthenticationCubit, AuthenticationState>(
    //   listener: (context, state) {
    //     goRouter.refresh();
    //   },
    //   child: child,
    // );
  }
}
