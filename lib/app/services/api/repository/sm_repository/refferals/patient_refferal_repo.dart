class PatientRefferalsRepo{
  static String patientRefferals ="/patient-referral";
  static String serviceRefferals = '/services-master';
  static String employeeClinical = '/employee-types/GetClinicianType';

////patient-referral/{pageNbr}/{NbrofRows}/{isIntake}/{isArchived}/{searchName}/{marketerId}/{referralSourceId}/{pcpId}
  static  String getPatientRefferals({required int pageNo, required int nbrOfRows, required String isIntake, required String isArchived,required String searchName, required String marketerId,required String referralSourceId, required String pcpId}){
    return "$patientRefferals/$pageNo/$nbrOfRows/$isIntake/$isArchived/$searchName/$marketerId/$referralSourceId/$pcpId";
  }

  static  String getPatientRefferalsWithId({required int id}){
    return "$patientRefferals/$id";
  }

  static  String getReffrealsServiceData(){
    return "$serviceRefferals";
  }

  static  String getReffrealsEmployeeClinicalType(){
    return "$employeeClinical";
  }
}