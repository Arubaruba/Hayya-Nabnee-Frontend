part of app;

final String i18nDir = '/i18n/';
final List<String> localeCodes = ['en', 'ar']; //The first one is the default locale

dynamic localeData;


@Formatter(name: 'i')
class I18n {

  call(dynamic value) {
    dynamic specialFunction = '';
    if (value.runtimeType == String) {
      if (specialFunction == 'switchToLocale') {
        loadLocale(value);
      } else if (localeData != null && localeData[value] != null) {
        return localeData[value];
      } else {
        return '_' + value + '_';
      }
    } else {
      print('i18n formatter requires a string, was given a ' + value.runtimeType.toString());
    }
  }
}

Future loadLocale(String locale) {
  if (localeCodes.contains(locale)) {
    final String localeFile = i18nDir + locale + '.json';
    return HttpRequest.getString(localeFile).then((String response) {
      JsonDecoder decoder = new JsonDecoder();
      try {
        localeData = decoder.convert(response);
        print(localeData);
      } catch (error) {
        print('Unable to parse locale file: ' + localeFile);
        print(error);
      }
      ;
    }).catchError((Error error) {
      print('Unable to load locale file: ' + localeFile);
      print(error.toString());
    });
  } else {
    print('Invalid locale given: ' + locale);
    return null;
  }
}
