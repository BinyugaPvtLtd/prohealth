class IntakePhysicianInfo{
  ///intake physician info
  static String physicianMaster = '/physician-master';
  static String physicianMasterAdd = '/physician-master/add';

  static String addPhysicianMaster() {
    return "$physicianMaster/";
  }

  ///physician-master/{id}
  static String patchPhysicianMaster({required int id}) {
    return "$physicianMaster/$id";
  }

  ///physician-master/patient/{patientId}
  static String getByIdPhysicianMaster({required int patientId}) {
    return "$physicianMaster/patient/$patientId";
  }
}