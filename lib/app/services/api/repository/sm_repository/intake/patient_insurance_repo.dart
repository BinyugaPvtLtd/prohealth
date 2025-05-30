class PatientInsuranceRepo{
  static String patientInsuranceDocuments = '/patient-document/patient';
  static String patientInsuranceDocumentsAdd = '/patient-insurance-documents/add';
  static String patientInsuranceDocumentAttach = '/patient-insurance-documents/attachDocument';
  static String patientInsuranceDocumentsDelete = '/patient-insurance-documents';
  static String patientInsuranceDocWithPtId = '/patient-insurance-documents/patient';



  static  String getPatientInsuranceDocuments({required int ptId,required bool isPrimary}){
    return "$patientInsuranceDocuments/$ptId/$isPrimary";
  }

  static  String addPatientInsuranceDocuments(){
    return "$patientInsuranceDocumentsAdd";
  }

  static  String attachPatientInsuranceDocuments({required int documentid}){
    return "$patientInsuranceDocumentAttach/$documentid";
  }

  static  String deletePatientInsuranceDocuments({required int documentid}){
    return "$patientInsuranceDocumentsDelete/$documentid";
  }

  static  String getPatientInsuranceDocumentsWithPtId({required int ptId}){
    return "$patientInsuranceDocWithPtId/$ptId";
  }
}