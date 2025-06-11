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
