// ignore_for_file: public_member_api_docs, sort_constructors_first
class UriResolver {
  final String endpoint;
  final String? path;

  UriResolver({
    required this.endpoint,
    this.path,
  });

  Uri uri(String path, [List<QueryParam>? queryParams]) {
    final query = StringBuffer()..write("?");
    queryParams ??= [];

    for (final param in queryParams) {
      if (param.value == null) continue;

      query.write(
        "${Uri.encodeComponent(param.key)}=${Uri.encodeComponent(param.value!)}",
      );
    }

    return Uri.parse(Uri.https(endpoint, path).toString() + query.toString());
  }
}

class QueryParam {
  final String key;
  final String? value;

  QueryParam({
    required this.key,
    this.value,
  });
}
