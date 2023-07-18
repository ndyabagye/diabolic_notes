import 'package:dartz/dartz.dart';
import 'package:diabolical_notes/core/failures.dart';
import 'package:diabolical_notes/domain/entities/todos.dart';
import 'package:diabolical_notes/domain/repositories/todos_repository.dart';

class GetTodos {
  final TodosRepository todosRepository;

  GetTodos({required this.todosRepository});

  Future<Either<Failure, List<Todos>>> execute() async {
    return todosRepository.getTodos();
  }
}
