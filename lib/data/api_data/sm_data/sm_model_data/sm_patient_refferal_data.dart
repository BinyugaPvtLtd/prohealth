class PatientModel {
  final int ptId;
  final String ptFirstName;
  final String ptLastName;
  final String ptContactNo;
  final String ptZipCode;
  final int ptChartNo;
  final String ptSummary;
  final String ptRefferalDate;
  final int fkSrvId;
  final int fkPtPrimaryDiagnosis;
  final List<int> fkPtSecondaryDiagnosis;
  final int fkPtRefferalSource;
  final int fkPtPcp;
  final int fkPtMarketer;
  final List<int> fkPtDiscplines;
  final int ptCoverageArea;
  final bool isIntake;
  final String? intakeTime;
  final bool isArchieved;
  final DateTime? archievedTime;
 // final int insuranceId;
  final DateTime createdAt;
  final DateTime ptDateOfBirth;
  final String? ptImgUrl;
  final int fk_rpti_id;
  final bool is_selfPay;
  final int fkempIdArchieved;
  final String documentName;
  //final String ptTime;
  final bool isScheduler;
  final String schedulerTime;
  final ServiceModel service;
  final List<PatientDiagnosesModel> patientDiagnoses;
  final ReferralSourceModel referralSource;
  final PCPModel pcp;
  final MarketerModel marketer;
  final List<InsuranceModel> insurance;
  final List<DisciplineModel> disciplines;
  final bool isPotential;
  final int thresould;
  PatientModel({
    required this.isScheduler,
    required this.schedulerTime,
    required this.isPotential,
    required this.thresould,
    required this.is_selfPay,
    required this.fk_rpti_id,
    required this.fkempIdArchieved,
   // required this.ptTime,
    required this.ptId,
    required this.ptFirstName,
    required this.ptLastName,
    required this.ptContactNo,
    required this.ptZipCode,
    required this.ptChartNo,
    required this.ptSummary,
    required this.ptRefferalDate,
    required this.fkSrvId,
    required this.fkPtPrimaryDiagnosis,
    required this.fkPtSecondaryDiagnosis,
    required this.fkPtRefferalSource,
    required this.fkPtPcp,
    required this.fkPtMarketer,
    required this.fkPtDiscplines,
    required this.ptCoverageArea,
    required this.isIntake,
    this.intakeTime,
    required this.isArchieved,
    this.archievedTime,
    //required this.insuranceId,
    required this.createdAt,
    required this.ptDateOfBirth,
    required this.ptImgUrl,
    required this.documentName,
    required this.service,
    required this.insurance,
    required this.patientDiagnoses,
    required this.referralSource,
    required this.pcp,
    required this.marketer,
    required this.disciplines,
  });
}

class ServiceModel {
  final int srvId;
  final String srvName;
  final String srvCode;

  ServiceModel({required this.srvId, required this.srvName, required this.srvCode});
}


class InsuranceModel {
  final int rptiId;
  final int fkptId;
  final String policy;
  final String insuranceProvider;
  final String insurancePlan;
  final bool eligibility;
  final bool authorization;
  final String? time;
  InsuranceModel({required this.rptiId, required this.fkptId, required this.policy, required this.insuranceProvider, required this.insurancePlan, required this.eligibility, required this.authorization, this.time,});
}

class PatientDiagnosesModel {

  final int rpt_dgn_id;
  final String dgnName;
  final String dgnCode;
  final int fk_pt_id;
  final int fk_dgn_id;
  final bool rpt_pdgm;
  final bool rpt_isPrimary;
  final int color;

  PatientDiagnosesModel({
    required this.fk_pt_id,
    required this.fk_dgn_id,
    required this.rpt_pdgm,
    required this.rpt_isPrimary,
    required this.color,
    required this.rpt_dgn_id,
    required this.dgnName,
    required this.dgnCode,
  });
}

class ReferralSourceModel {
  final int refSourceId;
  final String sourceName;
  final String description;
  final String referralSourceImgUrl;

  ReferralSourceModel({
    required this.refSourceId,
    required this.sourceName,
    required this.description,
    required this.referralSourceImgUrl,
  });
}

class PCPModel {
  final int phyId;
  final String phyFirstName;
  final String phyLastName;
  final String phyPicoNo;
  final bool phyPicoStatus;
  final String phyEmail;
  final String phyContact;

  PCPModel({
    required this.phyId,
    required this.phyFirstName,
    required this.phyLastName,
    required this.phyPicoNo,
    required this.phyPicoStatus,
    required this.phyEmail,
    required this.phyContact,
  });
}

class MarketerModel {
  final int employeeId;
  final String code;
  final String firstName;
  final String lastName;
  final String expertise;
  final String gender;
  final String imgurl;
  final String regOfficId;
  final String onboardingStatus;
  final int userId;
  final String ssnNbr;
  final String address;
  final int cityId;
  final DateTime dateOfBirth;
  final int departmentId;
  final String emergencyContact;
  final int employeeTypeId;
  final String employment;
  final String personalEmail;
  final String primaryPhoneNbr;
  final String secondryPhoneNbr;
  final String service;
  final String status;
  final String workEmail;
  final String workPhoneNbr;
  final int companyId;
  final DateTime createdAt;
  final String resumeurl;
  final String covreage;
  final dynamic approved;
  final dynamic terminationFlag;
  final int zoneId;
  final int countryId;
  final DateTime checkDate;
  final DateTime dateofResignation;
  final DateTime dateofTermination;
  final String finalAddress;
  final double finalPayCheck;
  final double grossPay;
  final String materials;
  final String methods;
  final double netPay;
  final String reason;
  final String rehirable;
  final String type;
  final DateTime dateofHire;
  final String position;
  final String driverLicenceNbr;
  final String race;
  final String rating;
  final String signatureURL;
  final int countyId;
  final dynamic active;
  final String summary;

  MarketerModel({
    required this.employeeId,
    required this.code,
    required this.firstName,
    required this.lastName,
    required this.expertise,
    required this.gender,
    required this.imgurl,
    required this.regOfficId,
    required this.onboardingStatus,
    required this.userId,
    required this.ssnNbr,
    required this.address,
    required this.cityId,
    required this.dateOfBirth,
    required this.departmentId,
    required this.emergencyContact,
    required this.employeeTypeId,
    required this.employment,
    required this.personalEmail,
    required this.primaryPhoneNbr,
    required this.secondryPhoneNbr,
    required this.service,
    required this.status,
    required this.workEmail,
    required this.workPhoneNbr,
    required this.companyId,
    required this.createdAt,
    required this.resumeurl,
    required this.covreage,
    required this.approved,
    required this.terminationFlag,
    required this.zoneId,
    required this.countryId,
    required this.checkDate,
    required this.dateofResignation,
    required this.dateofTermination,
    required this.finalAddress,
    required this.finalPayCheck,
    required this.grossPay,
    required this.materials,
    required this.methods,
    required this.netPay,
    required this.reason,
    required this.rehirable,
    required this.type,
    required this.dateofHire,
    required this.position,
    required this.driverLicenceNbr,
    required this.race,
    required this.rating,
    required this.signatureURL,
    required this.countyId,
    required this.active,
    required this.summary,
  });
}

class DisciplineModel {
  final int employeeTypeId;
  final String employeeType;
  final String color;
  final String abbreviation;
  final int departmentId;

  DisciplineModel({
    required this.employeeTypeId,
    required this.employeeType,
    required this.color,
    required this.abbreviation,
    required this.departmentId,
  });
}

/// employee type
class EmployeeClinicalData{
  final int emptypeId;
  final String empType;
  final String color;
  final String abbreviation;
  final int deptId;

  EmployeeClinicalData({required this.emptypeId, required this.empType,
  required this.color, required this.abbreviation, required this.deptId});
}


class SpacialOrderData{
  final int spcialorderid;
  final String spcialordername;
  final String description;
  final String createdat;
  final String updatedat;

  SpacialOrderData({required this.spcialorderid, required this.spcialordername, required this.description, required this.createdat, required this.updatedat});
}






class AddOrderData{
  final int  patientid;
  final List<int> specialOrderId;
  final String dateReceived;
  final String orderdate;
  final List<int> ptDisciplines;
  final int  merkatereid;
  final int refersourceid ;
  final String casemanger;
  final String trackingnote;
  final bool ordersignature;

  AddOrderData({
    required this.patientid,
    required this.specialOrderId,
    required this.dateReceived,
    required this.orderdate,
    required this.ptDisciplines, required this.merkatereid,
    required this.refersourceid, required this.casemanger,
    required this.trackingnote, required this.ordersignature});
}