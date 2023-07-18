import 'package:diabolical_notes/domain/entities/todos.dart';
import 'package:equatable/equatable.dart';

class TodosModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const TodosModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory TodosModel.fromJson(Map<String, dynamic> json) {
    return TodosModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }

  @override
  List<Object?> get props => [userId, id, title, completed];
}

extension TodosModelExtension on TodosModel {
  Todos get toTodos => Todos(
        userId: userId,
        id: id,
        title: title,
        completed: completed,
      );
}
