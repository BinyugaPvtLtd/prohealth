class PatientRefferalsRepo{
  static String patientRefferals ="/patient-referral";
  static String serviceRefferals = '/services-master';


  static  String getPatientRefferals({required int pageNo, required int nbrOfRows, required String isIntake, required String isArchived}){
    return "$patientRefferals/$pageNo/$nbrOfRows/$isIntake/$isArchived";
  }

  static  String getPatientRefferalsWithId({required int id}){
    return "$patientRefferals/$id";
  }

  static  String getReffrealsServiceData(){
    return "$serviceRefferals";
  }
}