class PatientRefferalsRepo{
  static String patientRefferals ="/patient-referral";
  static String serviceRefferals = '/services-master';
  static String employeeClinical = '/employee-types/GetClinicianType';
  static String patientInsuarnce = '/insurances-master';
  static String marketerApi = '/employees/department';

  /// patient document
  static String patientDocument = '/patient-document/patient';
  static String patientDocumentAdd = '/patient-document/add';
  static String patientDocumentDelete = '/patient-document';
  static String patientDocumentAttach = '/patient-document/attach-document';

  /// filter master repo
  static String patientRefferalsMaster = '/referral-sources';
  static String patientPhysicianMaster = '/physician-master';


  static  String getPatientRefferals({required int pageNo, required int nbrOfRows, required String isIntake, required String isArchived,required String isScheduled, required String searchName, required String marketerId,required String referralSourceId, required String pcpId}){
    return "$patientRefferals/$pageNo/$nbrOfRows/$isIntake/$isArchived/$isScheduled/$searchName/$marketerId/$referralSourceId/$pcpId";
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

  /// marketer data
  static  String getMarketerIdWithData({required int deptId}){
    return "$marketerApi/$deptId";
  }
}