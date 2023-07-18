import 'dart:convert';
import 'dart:io';

import 'package:diabolical_notes/core/exceptions.dart';
import 'package:diabolical_notes/data/models/todos.dart';
import 'package:http/http.dart' as http;

abstract class TodosRemoteDataSource {
  Future<List<TodosModel>> getTodos();
}

class TodosRemoteDataSourceImpl implements TodosRemoteDataSource {
  final http.Client client;

  final baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  TodosRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TodosModel>> getTodos() => _getDataFromUrl(path: '');

  Future<List<TodosModel>> _getDataFromUrl({required String path}) async {
    try {
      final response = await client.get(Uri.parse(baseUrl + path), headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset-utf-8',
      });
      switch (response.statusCode) {
        case 200:
          final results = (json.decode(response.body));
          final todos =
              (results as List).map((e) => TodosModel.fromJson(e)).toList();
          return todos;
        case 400:
          throw const ServerException(message: "Bad request");
        case 401:
          throw const ServerException(message: "Unauthorized");
        case 500:
          throw const ServerException(message: "Internal Server Error");
        default:
          throw const ServerException(message: "Unknown error");
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw e.toString();
    }
  }
}
