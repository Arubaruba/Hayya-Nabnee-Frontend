part of app;

@Injectable()
class JsonLoader {
  
  I18n i18n;
  GlobalMessenger globalMessenger;
  
  JsonLoader(this.i18n, this.globalMessenger);
  
  Future<dynamic> load(String url, {List<String> parameters}) {
    return loadJson(url, parameters: parameters).catchError((_) {
      globalMessenger.showMessage(i18n.call('Connection Error'));
    });
  }
}

Future<dynamic> loadJson(String url, {List<String> parameters}) {
  if(parameters != null) url = url + '?' + parameters.map((String parameter) => parameter).join('&');
  //Both JSON Errors and HttpExceptions need to be caught when this function is called!
  return HttpRequest.getString(url).then((String response) {
    JsonDecoder decoder = new JsonDecoder();
    return decoder.convert(response);
  });
}