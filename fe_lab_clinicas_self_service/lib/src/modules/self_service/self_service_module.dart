import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/documents_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan/documents_scan_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'documents/scan_confirm/documens_scan_confirm_page.dart';

class SelfServiceModule extends FlutterGetItModule{
  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton((i) => SelfServiceController())
  ];
  
  @override
  String get moduleRouteName => "/$MODULE_ROUTE_NAME"; //"/self-service";

  @override
  Map<String, WidgetBuilder> get pages => {
    "/" : (context) => const SelfServicePage(),
    "/$WHO_I_AM_ROUTE_NAME" : (context) => const WhoIAmPage(),
    "/$FIND_PATIENT_ROUTE_NAME" :(context) => const FindPatientPage(),
    "/$PATIENT_ROUTE_NAME":(context) => const PatientPage(),
    "/$DOCUMENTS_ROUTE_NAME":(context) => const DocumentsPage(),
    "/$DOCUMENTS_ROUTE_NAME/scan":(context) => const DocumentsScanPage(),
    "/$DOCUMENTS_ROUTE_NAME/scan/confirm":(context) => const DocumensScanConfirmPage(),
    "/$DONE_ROUTE_NAME":(context) => const DonePage(),
  };

}