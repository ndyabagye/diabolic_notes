import 'package:dartz/dartz.dart';
import 'package:diabolical_notes/core/failures.dart';
import 'package:diabolical_notes/domain/entities/todos.dart';

abstract class TodosRepository {
  Future<Either<Failure, List<Todos>>> getTodos();
}
