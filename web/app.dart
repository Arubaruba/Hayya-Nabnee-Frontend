library app;

import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';

part 'modules/json.dart';

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
  
  final String globalJsonFile = i18nDir + 'global.json';
  final String localJsonFile = i18nDir + localeCodes.first + '.json';
  
  //The the localization strings need to be loaded before the app can be displayed
  Future.wait([
    loadJson(globalJsonFile).then((dynamic data){
      globalJsonData = data;
    }).catchError((_){
      print('Unable to load: ' + globalJsonFile);
    }),
    loadJson(localJsonFile).then((dynamic data){
      localJsonData = data;
    }).catchError((_){
      print('Unable to load: ' + localJsonFile);
    }),
  ])
  .then((_){
    applicationFactory().addModule(new AppModule()).run();
  });
}
