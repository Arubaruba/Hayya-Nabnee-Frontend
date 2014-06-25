part of app;

const String i18nDir = '/i18n/';
final List<String> localeCodes = ['en', 'ar']; //The first one is the default locale

dynamic globalJsonData;
dynamic localJsonData;

@Formatter(name: 'i')
class I18n {
  call(dynamic value) {
    if (localJsonData != null && localJsonData[value] != null) {
      return localJsonData[value];
    } else {
      if (localJsonData != null) {
        print('Missing Localization String: '+value);
      }
      return '_' + value + '_';
    }
  }
}

@Controller(selector:'[i18n-switch]', publishAs: 'ctrl')
class I18nSwitch {
  void switchToLocale(String localeCode) {
    try {
      loadJson(i18nDir + localeCode + '.json').then((dynamic data){
        if (data != null) {
          localJsonData = data;
        }
      });
    } catch (exception) {
      print('Unable to load json and switch to locale: ' + localeCode);
      print(exception);
    }
  }
}
