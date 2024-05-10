import 'package:dubmeio/features/todos/todos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateDummyData extends StatelessWidget {
  const GenerateDummyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: CupertinoButton.filled(
        onPressed: () {
          for (var i = 0; i < 100; i++) {
            context.read<TodosBloc>().addTodo(
                  Todo(
                    title: 'Todo $i',
                    isCompleted: i.isEven,
                  ),
                );
          }
        },
        child: const Text('Generate Test Data'),
      ),
    );
  }
}
