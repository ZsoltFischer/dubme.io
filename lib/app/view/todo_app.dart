import 'package:dubmeio/app/theme.dart';
import 'package:dubmeio/app/view/widgets/app_bloc_providers.dart';
import 'package:dubmeio/l10n/arb/app_localizations.dart';
import 'package:dubmeio/routing/auth_redirecter.dart';
import 'package:dubmeio/routing/routes.dart';
import 'package:dubmeio_widgets/dubmeio_widgets.dart';
import 'package:flutter/cupertino.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerBuilder = RouterBuilder(
      routes: [
        // Routes that are specific for the todoapp
        TodoAppRoutes.appShell,
        TodoAppRoutes.profile,

        // Genral routes applicable to all Dubme.io apps
        Routes.authentication,
      ],
    );

    return AppBlocProviders(
      child: AuthRedirecter(
        child: SafeArea(
          child: CupertinoApp.router(
            theme: TodoAppTheme.cupertinoThemeData,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: routerBuilder.buildRouter(),
          ),
        ),
      ),
    );
  }
}
