class PatientInsuranceDocumentData{
  final int insuranceDocumentId;
  final int ptId;
  final String docUrl;
  final String docName;
  final bool isPrimary;
  final DateTime createdAt;
  final int createdBy;
  final String updatedAt;
  final int updatedBy;

  PatientInsuranceDocumentData({
    required this.insuranceDocumentId,
    required this.ptId,
    required this.docUrl,
    required this.docName,
    required this.isPrimary,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy});

}

class PatientInsuranceInfoData {
  final int rptiId;
  final int fkPtId;
  final String rptiPolicy;
  final String rptiInsuranceProvider;
  final String rptiInsurancePlan;
  final bool rptiEligibility;
  final bool rptiAuthorization;
  final String rptiLastCheckedTime;
  final String rptiName;
  final String rptiType;
  final String rptiCategory;
  final String rptiStreet;
  final String rptiSuite;
  final String rptiCity;
  final String rptiState;
  final String rptiZipcode;
  final String rptiContact;
  final String rptiEffectiveFrom;
  final String rptiEffectiveTo;
  final int rptiGroupNumber;
  final String rptiGroupName;
  final String rptiEmail;
  final bool rptiVerified;
  final String rptiComments;

  PatientInsuranceInfoData({
    required this.rptiId,
    required this.fkPtId,
    required this.rptiPolicy,
    required this.rptiInsuranceProvider,
    required this.rptiInsurancePlan,
    required this.rptiEligibility,
    required this.rptiAuthorization,
    required this.rptiLastCheckedTime,
    required this.rptiName,
    required this.rptiType,
    required this.rptiCategory,
    required this.rptiStreet,
    required this.rptiSuite,
    required this.rptiCity,
    required this.rptiState,
    required this.rptiZipcode,
    required this.rptiContact,
    required this.rptiEffectiveFrom,
    required this.rptiEffectiveTo,
    required this.rptiGroupNumber,
    required this.rptiGroupName,
    required this.rptiEmail,
    required this.rptiVerified,
    required this.rptiComments,
  });
}
