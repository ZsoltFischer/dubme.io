import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

/// General routes applicable to all Dubmeio apps.
class Routes {
  /// The splash screen route.
  static final authentication = GoRoute(
    path: '/authentication',
    pageBuilder: (context, state) => const CupertinoPage(
      //!TODO: implement the authentication in a separate package
      //!TODO: implement auth page in this widgets package
      child: Center(
        child: Text('Auth page'),
      ),
    ),
  );
}
