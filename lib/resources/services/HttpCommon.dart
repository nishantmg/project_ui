import 'package:http/http.dart' as http;

SpoonHttpClient client;

class SpoonHttpClient extends http.BaseClient
{
   http.Client httpClient = new http.Client();
   final Map defaultHeaders;
   SpoonHttpClient({this.defaultHeaders});
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // TODO: implement send
    request.headers.addAll(defaultHeaders);
    print("${request.method} : ${request.url} \n ${request.headers} \n");
    return httpClient.send(request);
  }

  addHeader(key, value)
  {
    defaultHeaders[key] = 'Bearer $value';
  }
}

SpoonHttpClient httpClient = makeHttpClient();

SpoonHttpClient makeHttpClient(){
  if(client == null)
  {
    var defaultHeaders = {
      'Content-Type': 'application/json'
    };
    client = new SpoonHttpClient(defaultHeaders: defaultHeaders);
  }
  return client;
}