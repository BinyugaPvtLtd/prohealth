import 'package:flutter/material.dart';

class PatientModels {
  final int ptId;
  final String ptFirstName;
  final String ptLastName;
  final String ptContactNo;
  final String ptZipCode;
  final int ptChartNo;
  final String ptSummary;
  final String ptRefferalDate;
  final DateTime ptDateOfBirth;
  final String? ptImgUrl;
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
  final DateTime createdAt;
  final bool isPotential;
  final int thresould;
  final ServiceModels service;
  final List<PatientDiagnosesModels> patientDiagnoses;
  final ReferralSourceModel referralSource;
  final PCPModels pcp;
  final MarketerModels marketer;
  final List<InsuranceModels> insurance;

  PatientModels({
    required this.ptId,
    required this.ptFirstName,
    required this.ptLastName,
    required this.ptContactNo,
    required this.ptZipCode,
    required this.ptChartNo,
    required this.ptSummary,
    required this.ptRefferalDate,
    required this.ptDateOfBirth,
    this.ptImgUrl,
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
    required this.createdAt,
    required this.isPotential,
    required this.thresould,
    required this.service,
    required this.patientDiagnoses,
    required this.referralSource,
    required this.pcp,
    required this.marketer,
    required this.insurance,
  });


}

class ServiceModels {
  final int srvId;
  final String srvName;
  final String srvCode;

  ServiceModels({
    required this.srvId,
    required this.srvName,
    required this.srvCode,
  });


}

class PatientDiagnosesModels {
  final int rptDgnId;
  final String dgnName;
  final String dgnCode;
  final int fkPtId;
  final int fkDgnId;
  final bool rptPdgm;
  final bool rptIsPrimary;
  final int color;

  PatientDiagnosesModels({
    required this.rptDgnId,
    required this.dgnName,
    required this.dgnCode,
    required this.fkPtId,
    required this.fkDgnId,
    required this.rptPdgm,
    required this.rptIsPrimary,
    required this.color,
  });



}

class ReferralSourceModel {
  final int refSrcId;
  final String refSrcName;

  ReferralSourceModel({
    required this.refSrcId,
    required this.refSrcName,
  });


}

class PCPModels {
  final int pcpId;
  final String pcpName;

  PCPModels({
    required this.pcpId,
    required this.pcpName,
  });

}

class MarketerModels {
  final int marketerId;
  final String marketerName;

  MarketerModels({
    required this.marketerId,
    required this.marketerName,
  });


}

class InsuranceModels {
  final int rptiId;
  final int fkPtId;
  final String policy;
  final String insuranceProvider;
  final String insurancePlan;
  final bool eligibility;
  final bool authorization;
  final String? time;

  InsuranceModels({
    required this.rptiId,
    required this.fkPtId,
    required this.policy,
    required this.insuranceProvider,
    required this.insurancePlan,
    required this.eligibility,
    required this.authorization,
    this.time,
  });



}





// patient_models.dart

class PatientModelss {
  final int ptId;
  final String ptFirstName;
  final String ptLastName;
  final String ptContactNo;
  final String ptZipCode;
  final int ptChartNo;
  final String ptSummary;
  final String ptRefferalDate;
  final DateTime ptDateOfBirth;
  final String ptImgUrl;
  final int fkSrvId;
  final int fkPtPrimaryDiagnosis;
  final List<int> fkPtSecondaryDiagnosis;
  final int fkPtRefferalSource;
  final int fkPtPcp;
  final int fkPtMarketer;
  final List<int> fkPtDiscplines;
  final int ptCoverageArea;
  final bool isIntake;
  final String intakeTime;
  final bool isArchieved;
  final DateTime? archievedTime;
  final DateTime createdAt;
  final bool isPotential;
  final int thresould;
  final ServiceModelss service;
  final List<PatientDiagnosesModelss> patientDiagnoses;
  final ReferralSourceModelss referralSource;
  final PCPModelss pcp;
  final MarketerModelss marketer;
  final List<InsuranceModelss> insurance;

  PatientModelss({
    required this.ptId,
    required this.ptFirstName,
    required this.ptLastName,
    required this.ptContactNo,
    required this.ptZipCode,
    required this.ptChartNo,
    required this.ptSummary,
    required this.ptRefferalDate,
    required this.ptDateOfBirth,
    required this.ptImgUrl,
    required this.fkSrvId,
    required this.fkPtPrimaryDiagnosis,
    required this.fkPtSecondaryDiagnosis,
    required this.fkPtRefferalSource,
    required this.fkPtPcp,
    required this.fkPtMarketer,
    required this.fkPtDiscplines,
    required this.ptCoverageArea,
    required this.isIntake,
    required this.intakeTime,
    required this.isArchieved,
    required this.archievedTime,
    required this.createdAt,
    required this.isPotential,
    required this.thresould,
    required this.service,
    required this.patientDiagnoses,
    required this.referralSource,
    required this.pcp,
    required this.marketer,
    required this.insurance,
  });
}

class PatientDiagnosesModelss {
  final int rptDgnId;
  final String dgnName;
  final String dgnCode;
  final int fkPtId;
  final int fkDgnId;
  final bool rptPdgm;
  final bool rptIsPrimary;
  final int color;

  PatientDiagnosesModelss({
    required this.rptDgnId,
    required this.dgnName,
    required this.dgnCode,
    required this.fkPtId,
    required this.fkDgnId,
    required this.rptPdgm,
    required this.rptIsPrimary,
    required this.color,
  });
}

class ServiceModelss {
  final int srvId;
  final String srvName;
  final String srvCode;

  ServiceModelss({
    required this.srvId,
    required this.srvName,
    required this.srvCode,
  });
}

class ReferralSourceModelss {
  final int refSrcId;
  final String refSrcName;

  ReferralSourceModelss({
    required this.refSrcId,
    required this.refSrcName,
  });
}

class PCPModelss {
  final int pcpId;
  final String pcpName;

  PCPModelss({
    required this.pcpId,
    required this.pcpName,
  });
}

class MarketerModelss {
  final int marketerId;
  final String marketerName;

  MarketerModelss({
    required this.marketerId,
    required this.marketerName,
  });
}

class InsuranceModelss {
  final int? rptiId;
  final int? fkPtId;
  final String? policy;
  final String? insuranceProvider;
  final String? insurancePlan;
  final String? eligibility;
  final String? authorization;
  final String? time;

  InsuranceModelss({
    this.rptiId,
    this.fkPtId,
    this.policy,
    this.insuranceProvider,
    this.insurancePlan,
    this.eligibility,
    this.authorization,
    this.time,
  });
}






class PatientWithDisciplinesModel {
  final PatientModel patient;
  final List<DisciplineAssignmentModel> disciplineAssignments;

  PatientWithDisciplinesModel({
    required this.patient,
    required this.disciplineAssignments,
  });
}


class DisciplineAssignmentModel {
  final int disciplineId;
  final int? employeedId;
  final String notesToClinician;
  final DateTime createdAt;
  final DateTime updatedAt;
  final EmployeeTypeModel employeeType;

  DisciplineAssignmentModel({
    required this.disciplineId,
    this.employeedId,
    required this.notesToClinician,
    required this.createdAt,
    required this.updatedAt,
    required this.employeeType,
  });
}


class EmployeeTypeModel {
  final int employeeTypeId;
  final String employeeType;
  final String color;
  final String abbreviation;
  final int departmentId;

  EmployeeTypeModel({
    required this.employeeTypeId,
    required this.employeeType,
    required this.color,
    required this.abbreviation,
    required this.departmentId,
  });
}


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
  final DateTime createdAt;
  final DateTime ptDateOfBirth;
  final String ptImgUrl;
  final int? fk_rpti_id;
  final int? fkempIdArchieved;
  final bool is_selfPay;
  final String? documentName;
  final bool moveToScheduler;
  final String? moveToSchedulerDatetime;
  final bool isNonAdmit;
  final String? admitDateTime;

  PatientModel({
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
    required this.createdAt,
    required this.ptDateOfBirth,
    required this.ptImgUrl,
    this.fk_rpti_id,
    this.fkempIdArchieved,
    required this.is_selfPay,
    this.documentName,
    required this.moveToScheduler,
    this.moveToSchedulerDatetime,
    required this.isNonAdmit,
    this.admitDateTime,
  });
}
