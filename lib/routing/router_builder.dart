import 'package:dubmeio/routing/not_found_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

/// Root navigator key for the app.
final _rootNavigatorKey = GlobalKey<NavigatorState>();

class RouterBuilder {
  RouterBuilder({
    required List<RouteBase> routes,
  }) : _routes = routes;

  final List<RouteBase> _routes;

  GoRouter buildRouter() => GoRouter(
        initialLocation: '/',
        navigatorKey: _rootNavigatorKey,
        debugLogDiagnostics: kDebugMode,
        //!TODO: Implement authentication redirections if applicable
        redirect: (context, state) async {
          return null;
        },
        routes: _routes,
        errorBuilder: (context, state) => const NotFoundScreen(),
      );
}
