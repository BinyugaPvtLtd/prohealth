class PatientRefferalsRepo{
  static String patientRefferals ="/patient-referral";


  static  String getPatientRefferals({required int pageNo, required int nbrOfRows}){
    return "$patientRefferals/$pageNo/$nbrOfRows";
  }
}