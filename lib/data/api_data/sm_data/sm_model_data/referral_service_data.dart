class ServicePatientReffralsData{
  final int serviceId;
  final String serviceName;
  final String serviceCode;
  ServicePatientReffralsData({required this.serviceId, required this.serviceName, required this.serviceCode,});
}

/// refferal sources
class PatientRefferalSourcesData{
  final int ref_source_id;
  final String source_name;
  final String description;
  final String referral_source_img_url;
  PatientRefferalSourcesData({
    required this.ref_source_id,
    required this.source_name,
    required this.description,
    required this.referral_source_img_url});
}

/// patient physician master
class PatientPhysicianMasterData{
  final int phy_id;
  final String phy_first_name;
  final String phy_last_name;
  final String phy_pico_no;
  final bool phy_pico_status;
  final String phy_email;
  final String phy_contact;

  PatientPhysicianMasterData({
    required this.phy_id,
    required this.phy_first_name,
    required this.phy_last_name,
    required this.phy_pico_no,
    required this.phy_pico_status,
    required this.phy_email,
    required this.phy_contact});

}


class PatientMarketerData{
  final int employeeId;
  final String firstName;
  final String lastName;
  final int departmentId;
  final int employeeTypeId;
  PatientMarketerData({
    required this.employeeTypeId,
    required this.employeeId, required this.firstName, required this.lastName, required this.departmentId});
}

class PatientDiagnosisMasterData{
  final int dgnId;
  final String dgnName;
  final String dgnCode;

  PatientDiagnosisMasterData({required this.dgnId, required this.dgnName, required this.dgnCode});

}



class ReferralSourcesData{
  final int refsouid;
  final String sourcename ;
  final String description;
  final String imgurl ;
  final String docname;

  ReferralSourcesData({required this.refsouid, required this.sourcename, required this.description, required this.imgurl, required this.docname, });
}
