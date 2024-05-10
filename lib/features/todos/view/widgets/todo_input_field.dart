import 'package:dubmeio/features/todos/todos.dart';
import 'package:dubmeio/features/todos/view/widgets/generate_dummy_data.dart';
import 'package:dubmeio_utils/dubmeio_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A sliver that displays a text field for adding a [Todo].
class TodoInputField extends StatelessWidget {
  /// Creates a [TodoInputField].
  const TodoInputField({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
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
              const GenerateDummyData(),
              Text(
                'Use the generation to test the SliverPinnedHeaderSection',
                style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
