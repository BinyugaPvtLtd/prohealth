class RelatedPartiesRepo{
  static String emergencyContact = '/emergency-contact';
  static String rolePath = '/related-parties/role';
  static String typePath = '/related-parties/type';


  static String getEmergencyContact({required int ptId}){
    return "$emergencyContact/patient/$ptId";
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