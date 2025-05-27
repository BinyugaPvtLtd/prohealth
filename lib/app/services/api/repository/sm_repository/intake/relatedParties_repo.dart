class RelatedPartiesRepo{
  static String emergencyContact = '/emergency-contact';
  static String rolePath = '/related-parties/role';
  static String typePath = '/related-parties/type';
  static String relatedParties = '/related-parties/patient-representative/patient/';
  static String representativeAdd = '/related-parties/patient-representative';


  static String getEmergencyContact({required int ptId}){
    return "$emergencyContact/patient/$ptId";
  }

  static String getRelatedRepresentive({required int ptId}){
    return "$relatedParties/$ptId";
  }

  static String addRelatedRepresentive(){
    return "$representativeAdd";
  }

  static String addEmergencyContact(){
    return "$emergencyContact";
  }

  static String getRelatedPartiesRole(){
    return "$rolePath";
  }

  static String getRelatedPartiesType(){
    return "$typePath";
  }
}