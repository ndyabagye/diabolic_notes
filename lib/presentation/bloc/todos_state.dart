part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {}

class TodosInitial extends TodosState {
  @override
  List<Object?> get props => [];
}

class TodosLoading extends TodosState {
  @override
  List<Object?> get props => [];
}

class TodosLoadedWithSuccess extends TodosState {
  final List<Todos> todos;

  TodosLoadedWithSuccess({required this.todos});
  @override
  List<Object?> get props => [todos];
}

class TodosLoadedWithError extends TodosState {
  final String message;

  TodosLoadedWithError({required this.message});
  @override
  List<Object?> get props => [message];
}
