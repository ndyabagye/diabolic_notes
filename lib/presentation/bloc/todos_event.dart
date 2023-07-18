part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {}

class GetTodosEvent extends TodosEvent {
  GetTodosEvent();

  @override
  List<Object?> get props => [];
}
