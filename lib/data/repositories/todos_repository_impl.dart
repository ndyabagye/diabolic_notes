import 'package:dartz/dartz.dart';
import 'package:diabolical_notes/core/failures.dart';
import 'package:diabolical_notes/data/datasources/todos_remote_datasource.dart';
import 'package:diabolical_notes/data/models/todos.dart';
import 'package:diabolical_notes/domain/entities/todos.dart';
import 'package:diabolical_notes/domain/repositories/todos_repository.dart';

class TodosRepositoryImpl extends TodosRepository {
  final TodosRemoteDataSource remoteDataSource;

  TodosRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Todos>>> getTodos() async {
    try {
      final todosModels = await remoteDataSource.getTodos();
      final todos = todosModels.map((e) => e.toTodos).toList();
      return Right(todos);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
