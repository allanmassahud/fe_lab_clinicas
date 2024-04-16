import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'theme/lab_clinicas_theme.dart';

class LabClinicasCoreConfig extends StatelessWidget {

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pageBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;
  
  const LabClinicasCoreConfig({ 
    super.key,
    this.binding,
    this.pages,
    this.pageBuilders, 
    this.modules, required this.title
  });

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: binding,
      // bindingsBuilder: () => [
      //   Bind.lazySingleton((i) => "Batata")
      // ],
      pages: [...pages ?? [], ...pageBuilders ?? []],
      modules: modules,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: LabClinicasLoader(),
          builder: (navigatorOberver){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorObservers: [
                navigatorOberver,
                flutterGetItNavObserver
              ],
              routes: routes,
              title: title,
              theme: LabClinicasTheme.lightTheme,
              darkTheme: LabClinicasTheme.darkTheme,
            );
          }
        );
      },
    );
  }
}