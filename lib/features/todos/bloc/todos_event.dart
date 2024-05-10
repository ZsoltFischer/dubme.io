part of 'todos_bloc.dart';

@immutable
sealed class TodosEvent {}

class AddTodo extends TodosEvent {
  AddTodo({
    required this.todo,
  });

  final Todo todo;
}

class UpdateTodo extends TodosEvent {
  UpdateTodo({
    required this.todo,
  });

  final Todo todo;
}

class DeleteTodo extends TodosEvent {
  DeleteTodo({
    required this.todo,
  });

  final Todo todo;
}

class ToggleTodo extends TodosEvent {
  ToggleTodo({
    required this.todo,
  });

  final Todo todo;
}
