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