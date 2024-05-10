part of 'todos_bloc.dart';

class TodosState extends Equatable {
  const TodosState({
    required this.todos,
  });

  factory TodosState.initial() {
    return const TodosState(todos: []);
  }

  final List<Todo> todos;

  TodosState copyWith({
    List<Todo>? todos,
  }) {
    return TodosState(
      todos: todos ?? this.todos,
    );
  }

  List<Todo> get completedTodos =>
      todos.where((todo) => todo.isCompleted).toList();

  List<Todo> get activeTodos =>
      todos.where((todo) => !todo.isCompleted).toList();

  @override
  List<Object?> get props => [
        todos,
      ];
}
