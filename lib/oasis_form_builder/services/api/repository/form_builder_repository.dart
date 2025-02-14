class FormBuilderRepository {
  static String patientFormInIt = "/patient-form/init";
  static String _patientFormId = "/patient-form/id/";
  static String patientFormAnswer = "/patient-form/answer";

  /// /hr-dropdowns/total/employees/newJoinee/{companyId}
  static String getPatientFormById({required int patientId}) {
    return "$_patientFormId/$patientId";
  }
}
