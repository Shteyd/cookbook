// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cookbook/data/api/mappers/search_mapper.dart';
import 'package:cookbook/data/api/uri_resolver.dart';
import 'package:cookbook/data/constants.dart';
import 'package:cookbook/domain/features/search/search_entities.dart';
import 'package:cookbook/domain/features/search/search_repository.dart';
import 'package:http/http.dart' as http;

class SearchRepositoryImpl implements SearchRepository {
  const SearchRepositoryImpl({
    required this.uriResolver,
    required this.client,
  });

  final UriResolver uriResolver;
  final http.Client client;

  @override
  Future<int> pagesCount(String input) async {
    final response = await client.get(
      uriResolver.uri('/retsepty', [QueryParam(key: "querry", value: input)]),
      headers: {'user-agent': userAgent},
    );
    final body = utf8.decode(response.bodyBytes);

    return PageCountMapper.fromHtml(body);
  }

  @override
  Future<List<SearchRecipe>> search(String input) async {
    final response = await client.get(
      uriResolver.uri('/retsepty', [QueryParam(key: "querry", value: input)]),
      headers: {'user-agent': userAgent},
    );
    final body = utf8.decode(response.bodyBytes);

    return SearchRecipeMapper.fromHtml(body);
  }
}
