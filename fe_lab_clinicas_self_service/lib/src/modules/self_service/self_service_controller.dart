// ignore_for_file: constant_identifier_names
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps { none, whoIam, findPatient, patient, documents, done, restart }
const MODULE_ROUTE_NAME = "self-service";
const WHO_I_AM_ROUTE_NAME = "who-i-am";
const FIND_PATIENT_ROUTE_NAME = "find-patient";
const PATIENT_ROUTE_NAME = "patient";
const DOCUMENTS_ROUTE_NAME = "documents";
const DONE_ROUTE_NAME = "done";



class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);
  FormSteps get step => _step.value;

  void startProcess(){
    _step.value = FormSteps.whoIam;//_step.forceUpdate(FormSteps.whoIam);
  }

  void goToPatient(){
    _step.value = FormSteps.patient;//_step.forceUpdate(FormSteps.patient);
  }
}
