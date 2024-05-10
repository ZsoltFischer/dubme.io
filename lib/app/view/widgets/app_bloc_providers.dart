import 'package:dubmeio/features/todos/todos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc(),
        ),
      ],
      child: child,
    );
  }
}
