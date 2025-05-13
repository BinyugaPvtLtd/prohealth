class PatientRefferalsRepo{
  static String patientRefferals ="/patient-referral";
  static String serviceRefferals = '/services-master';
  static String employeeClinical = '/employee-types/GetClinicianType';
  static String patientInsuarnce = '/insurances-master';

  /// patient document
  static String patientDocument = '/patient-documents/patient';
  static String patientDocumentAdd = '/patient-documents/add';
  static String patientDocumentDelete = '/patient-documents';
  static String patientDocumentAttach = '/patient-documents/attach-document';

  /// filter master repo
  static String patientRefferalsMaster = '/referral-sources';
  static String patientPhysicianMaster = '/physician-master';


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

  static  String getReffrealsInsurance(){
    return "$patientInsuarnce";
  }

  static  String getReffrealsInsuranceWithId({required int id}){
    return "$patientInsuarnce/$id";
  }

  static  String getPatientDocument({required int patientId}){
    return "$patientDocument/$patientId";
  }

  static  String addPatientDocument(){
    return "$patientDocumentAdd";
  }

  static  String deletePatientDocument({required int id}){
    return "$patientDocumentDelete/$id";
  }

  static  String attachPatientDocument({required int rptd_id}){
    return "$patientDocumentAttach/$rptd_id";
  }

  /// filter master

  static  String patientPhysicianmaster(){
    return "$patientPhysicianMaster";
  }

  static  String patientReffrealsSources(){
    return "$patientRefferalsMaster";
  }
}