class PatientRefferalsRepo{
  static String patientRefferals ="/patient-referral";


  static  String getPatientRefferals({required int pageNo, required int nbrOfRows, required String isIntake, required String isArchived}){
    return "$patientRefferals/$pageNo/$nbrOfRows/$isIntake/$isArchived";
  }
}