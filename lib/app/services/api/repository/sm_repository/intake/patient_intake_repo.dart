class PatientIntakeRepo{
  static String demographich = '/demographics';

  static  String addPatientDemographich(){
    return "$demographich";
  }

  static  String getPatientDemographichWithPtId({required int ptId}){
    return "$demographich/patient/$ptId";
  }
}