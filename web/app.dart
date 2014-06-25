library app;

import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';

part 'controllers/project_list.dart';
part 'controllers/i18n.dart';

const bool DEBUG_MODE = true;

class AppModule extends Module {
  AppModule() {
    bind(RouteInitializerFn, toValue: initRoutes);
    bind(I18n);
    bind(ProjectList);
  }
}

void initRoutes(Router router, RouteViewFactory view) {
  router.root
      ..addRoute(defaultRoute: true, name: 'projects', path: '/projects', enter: view('views/project_list.html'))
      ..addRoute(name: '', path: '/project/:projectId', enter: view('views/project.html'));
}

main() {
  //The the localization strings need to be loaded before the app can be displayed
  loadLocale(localeCodes.first).then((_){
    applicationFactory().addModule(new AppModule()).run();
  });
}
