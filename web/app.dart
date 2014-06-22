import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart'

void initAppRouter(Router router, ViewFactory view) {
  router.root
    ..addRoute(
      defaultRoute: true,
      name: 'projects',
      path: '/projects',
      enter: './views/projects.html')
}

class AppModule extends Module {
  value(RouteInitializerFn, initAppRouter);
}

main() {
  applicationFactory(new AppModule()).run();
}
