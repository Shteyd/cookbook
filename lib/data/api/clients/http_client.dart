import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  factory HttpClient(
    http.Client baseClient,
    List<http.Client Function(http.Client)> innerClients,
  ) {
    var curClient = baseClient;
    for (final constructor in innerClients) {
      curClient = constructor(curClient);
    }
    return HttpClient._(curClient);
  }

  HttpClient._(this.innerClient);

  http.Client innerClient;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final res = await innerClient.send(request);
    return res;
  }
}
