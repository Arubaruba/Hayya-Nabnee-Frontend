part of app;

final String i18nDir = '/i18n/';
final List<String> localeCodes = ['en', 'ar']; //The first one is the default locale

dynamic localeData;


@Formatter(name: 'i')
class I18n {
  call(dynamic value) {
    if (localeData != null && localeData[value] != null) {
      return localeData[value];
    } else {
      if (localeData != null) {
        print('Missing Localization String: '+value);
      }
      return '_' + value + '_';
    }
  }
}

@Controller(selector:'[i18n-switch]', publishAs: 'ctrl')
class I18nSwitch {
  void switchToLocale(String localeCode) {
    if (localeCodes.contains(localeCode)) {
      loadLocale(localeCode);
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
