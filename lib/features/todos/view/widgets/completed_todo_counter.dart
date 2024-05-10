import 'package:dubmeio/features/todos/bloc/todos_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedTodoCounter extends StatelessWidget {
  const CompletedTodoCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Text(
            'Completed TODOs:',
            style: CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle,
          ),
        ),
        BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            return Text(
              '${state.completedTodos.length}/${state.todos.length}',
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navLargeTitleTextStyle
                  .copyWith(color: CupertinoColors.systemBlue),
            );
          },
        ),
      ],
    );
  }
}
