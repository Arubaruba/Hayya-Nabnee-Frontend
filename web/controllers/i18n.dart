part of app;

const String i18nDir = '/i18n/';
final List<String> localeCodes = ['en']; //The first one is the default locale
String currentLocale = 'en';

dynamic globalJsonData;
dynamic localJsonData;

@Formatter(name: 'i')
class I18n {

  Scope scope;

  I18n(this.scope);

  call(var value, [var arg]) {

    List<dynamic> jsonData = (arg == 'g') ? globalJsonData : localJsonData;

    if (jsonData != null && jsonData[value] != null) {
      return jsonData[value];
    } else {
      if (jsonData != null) {
        print('Missing Localization String: ' + value);
      }
      return '_' + value + '_';
    }
  }
}

@Controller(selector: '[i18n-switch]', publishAs: 'languageSwitch')
class I18nSwitch {

  bool showBody = true;
  RootScope rootScope;

  I18nSwitch(this.rootScope);

  List<String> getOtherLocales() {
    return localeCodes.where((String code) => code != currentLocale).toList();
  }

  void setLocale(String localeCode) {
    try {
      loadJson(i18nDir + localeCode + '.json').then((dynamic data) {
        if (data != null) {
          localJsonData = data;
          currentLocale = localeCode;
          window.localStorage['language'] = localeCode;
          showBody = false;
          rootScope.digest();
          showBody = true;
        }
      });
    } catch (exception) {
      print('Unable to load json and switch to locale: ' + localeCode);
      print(exception);
    }
  }
}

Future<List> loadI18nData(String localeCode) {

  final String globalJsonFile = i18nDir + 'global.json';
  final String localJsonFile = i18nDir + localeCode + '.json';

  return Future.wait([loadJson(globalJsonFile).then((dynamic data) {
      globalJsonData = data;
    }).catchError((_) {
      print('Unable to load: ' + globalJsonFile);
    }), loadJson(localJsonFile).then((dynamic data) {
      localJsonData = data;
    }).catchError((_) {
      print('Unable to load: ' + localJsonFile);
    }),]);
}
