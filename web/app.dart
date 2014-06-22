import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';

class AppModule extends Module {
  AppModule() {
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
        enter: view('views/projects.html'));
  }
}

main() {
  applicationFactory().addModule(new AppModule()).run();
}
