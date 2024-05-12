import 'package:dubmeio/features/todos/todos.dart';
import 'package:dubmeio_utils/dubmeio_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A sliver that displays a text field for adding a [Todo].
class TodoInputField extends StatefulWidget {
  /// Creates a [TodoInputField].
  const TodoInputField({
    super.key,
  });

  @override
  State<TodoInputField> createState() => _TodoInputFieldState();
}

class _TodoInputFieldState extends State<TodoInputField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: CupertinoTextField(
                  placeholder: 'Add a todo!',
                  controller: _controller,
                  onSubmitted: (value) {
                    context.read<TodosBloc>().addTodo(
                          Todo(
                            title: value,
                          ),
                        );
                    _controller.clear();
                  },
                  textInputAction: TextInputAction.done,
                ),
              ),
              if (context.isMobile)
                IconButton(
                  onPressed: () {
                    context.read<TodosBloc>().addTodo(
                          Todo(title: _controller.text),
                        );
                    _controller.clear();
                  },
                  icon: const Icon(Icons.send_rounded),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
