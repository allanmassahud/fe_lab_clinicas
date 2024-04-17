import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
    
class SelfServicePage extends StatefulWidget {

  const SelfServicePage({ super.key });

  @override
  State<SelfServicePage> createState() => _SelfServicePageState();
}




class _SelfServicePageState extends State<SelfServicePage> with MessageViewMixin{
  final _controller = Injector.get<SelfServiceController>();
  
  @override
  void initState() {
    super.initState();
    messageListener(_controller);
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      _controller.startProcess();
      effect(() {
        final step = _controller.step;
        var route = "/$MODULE_ROUTE_NAME/"; 
        switch(step){
          case FormSteps.none:
            return;
          case FormSteps.whoIam:
            route+= WHO_I_AM_ROUTE_NAME;
          case FormSteps.findPatient:
            route+= FIND_PATIENT_ROUTE_NAME;
          case FormSteps.patient:
            route+= PATIENT_ROUTE_NAME;
          case FormSteps.documents:
            route+= DOCUMENTS_ROUTE_NAME;
          case FormSteps.done:
            route+= DONE_ROUTE_NAME;
          case FormSteps.restart:
            return;
        }
        Navigator.of(context).pushNamed(route);
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}