part of app;

Future<dynamic> loadJson(String url, {List<String> parameters}) {
  if(parameters != null) url = url + '?' + parameters.map((String parameter) => parameter).join('&');
  //Both JSON Errors and HttpExceptions need to be caught when this function is called!
  return HttpRequest.getString(url).then((String response) {
    JsonDecoder decoder = new JsonDecoder();
    return decoder.convert(response);
  });
}
