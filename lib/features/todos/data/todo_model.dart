import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

/// Representation of a `todo` item.
@immutable
class Todo extends Equatable {
  Todo({
    required this.title,
    String? id,
    this.isCompleted = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  /// The ID of the `todo`.
  final String id;

  /// The title of the `todo`.
  final String title;

  /// Whether the `todo` is done.
  final bool isCompleted;

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        isCompleted,
      ];
}
