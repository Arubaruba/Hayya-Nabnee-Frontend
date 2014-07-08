library app;

@MirrorsUsed(targets: const['app'], override: '*')
import 'dart:mirrors';
import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';

import 'config.dart';

part 'modules/json.dart';

part 'controllers/sign_up.dart';
part 'controllers/i18n.dart';
part 'controllers/facebook.dart';
part 'controllers/global_messenger.dart';

class AppModule extends Module {
  AppModule() {
    bind(RouteInitializerFn, toValue: initRoutes);
    bind(I18n);
    bind(I18nSwitch);
    bind(SignUp);
    bind(Facebook);
    bind(JsonLoader);
    bind(GlobalMessenger);
  }
}

void initRoutes(Router router, RouteViewFactory view) {
  router.root
      ..addRoute(name: 'projects', path: '/projects', enter: view('views/project_list.html'))
      ..addRoute(name: 'sign_up', path: '/sign_up', enter: view('views/sign_up.html'))
      
      ..addRoute(defaultRoute: true, name: 'page_not_found', path: '/page_not_found', enter: view('views/page_not_found.html'));
}

main() {
  //The the localization strings need to be loaded before the app can be displayed
  if(window.localStorage.containsKey("language")) currentLocale = window.localStorage["language"];
  loadI18nData(currentLocale).then((_){
    applicationFactory().addModule(new AppModule()).run();
  });
}
