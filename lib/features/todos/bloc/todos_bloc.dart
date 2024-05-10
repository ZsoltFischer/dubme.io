import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dubmeio/features/todos/data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'todos_event.dart';
part 'todos_state.dart';

/// {@template todos_bloc}
/// A simple [Bloc] that manages a list of [Todo]s.
/// {@endtemplate}
class TodosBloc extends Bloc<TodosEvent, TodosState> {
  /// {@macro todos_bloc}
  TodosBloc() : super(TodosState.initial()) {
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<ToggleTodo>(_onToggleTodo);
  }

  /// Adds a [Todo] to the list of todos.
  void addTodo(Todo todo) {
    add(AddTodo(todo: todo));
  }

  /// Deletes a [Todo] from the list of todos.
  void deleteTodo(Todo todo) {
    add(DeleteTodo(todo: todo));
  }

  /// Updates a [Todo] in the list of todos.
  void updateTodo({
    required Todo updatedTodo,
  }) {
    add(UpdateTodo(todo: updatedTodo));
  }

  /// Toggles the completeness of a [Todo].
  void toggleTodo({
    required Todo todo,
  }) {
    add(ToggleTodo(todo: todo));
  }

  /// Handles adding a [Todo] to the list of todos.
  FutureOr<void> _onAddTodo(
    AddTodo event,
    Emitter<TodosState> emit,
  ) {
    final updatedTodos = List<Todo>.from(state.todos)..add(event.todo);
    emit(
      state.copyWith(
        todos: updatedTodos,
      ),
    );
  }

  /// Handles deleting a [Todo] from the list of todos.
  FutureOr<void> _onDeleteTodo(
    DeleteTodo event,
    Emitter<TodosState> emit,
  ) {
    final updatedTodos = List<Todo>.from(state.todos)..remove(event.todo);
    emit(TodosState(todos: updatedTodos));
  }

  /// Handles updating a [Todo] in the list of todos.
  FutureOr<void> _onUpdateTodo(
    UpdateTodo event,
    Emitter<TodosState> emit,
  ) {
    final updatedTodos = state.todos.map((todo) {
      return todo.id == event.todo.id ? event.todo : todo;
    }).toList();
    emit(TodosState(todos: updatedTodos));
  }

  /// Handles toggling the completeness of a [Todo].
  FutureOr<void> _onToggleTodo(
    ToggleTodo event,
    Emitter<TodosState> emit,
  ) {
    final updatedTodos = state.todos.map((todo) {
      return todo.id == event.todo.id
          ? event.todo.copyWith(isCompleted: !event.todo.isCompleted)
          : todo;
    }).toList();
    emit(TodosState(todos: updatedTodos));
  }
}
