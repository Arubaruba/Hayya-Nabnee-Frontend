library app;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';

part 'modules/project_list.dart';

class AppModule extends Module {
  AppModule() {
    type(ProjectList);
    value(RouteInitializerFn, new AppRouter());
  }
}

class AppRouter implements RouteInitializer {

  call(Router router, ViewFactory view) {
    router.root

      ..addRoute(
        defaultRoute: true,
        name: 'projects',
        path: '/projects',
        enter: view('views/project_list.html'))

      ..addRoute(
        name: '',
        path: '/project/:projectId',
        enter: view('views/project.html'));
  }
}

main() {
  applicationFactory().addModule(new AppModule()).run();
}
