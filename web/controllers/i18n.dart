part of app;

const String i18nDir = '/i18n/';
final List<String> localeCodes = ['en', 'ar']; //The first one is the default locale
String currentLocale = 'en';

dynamic globalJsonData;
dynamic localJsonData;

@Formatter(name: 'i')
class I18n {
  call(var value, [var arg]) {
    
    List<dynamic> jsonData = (arg == 'g') ? globalJsonData : localJsonData;
    
    if (jsonData != null && jsonData[value] != null) {
      return jsonData[value];
    } else {
      if (jsonData != null) {
        print('Missing Localization String: '+value);
      }
      return '_' + value + '_';
    }
  }
}

@Controller(selector:'[i18n-switch]', publishAs: 'ctrl')
class I18nSwitch {

  List<String> getOtherLocales() {
    return localeCodes.where((String code) => code != currentLocale).toList();
  }

  void switchToLocale(String localeCode) {
    try {
      loadJson(i18nDir + localeCode + '.json').then((dynamic data){
        if (data != null) {
          localJsonData = data;
          currentLocale = localeCode;
        }
      });
    } catch (exception) {
      print('Unable to load json and switch to locale: ' + localeCode);
      print(exception);
    }
  }
}
