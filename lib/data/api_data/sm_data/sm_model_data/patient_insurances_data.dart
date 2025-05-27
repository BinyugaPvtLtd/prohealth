class PatientInsurancesData{
  final int insurance_id;
  final String insurance_policy;
  final String insurance_provider;
  final String insurance_plan;

  PatientInsurancesData({
    required this.insurance_id,
    required this.insurance_policy,
    required this.insurance_provider,
    required this.insurance_plan});
}

/// patient documents
class PatientDocumentsData{
  final int rptd_id;
  final int fk_pt_id;
  final String rptd_url;
  final String documentName;
  final String rptd_created_at;
  final int rptd_created_by;
  final int rptd_document_type;
  final String rptd_content;


  PatientDocumentsData({required this.rptd_id,
    required this.documentName,
    required this.fk_pt_id,
    required this.rptd_url,
    required this.rptd_created_at, required this.rptd_created_by, required this.rptd_document_type,
    required this.rptd_content});
}

///patient document billing attachment
class PatientDocumentsBillingData{
  final int rptd_id;
  final int fk_pt_id;
  final String rptd_url;
  final String documentName;
  final String rptd_created_at;
  final int rptd_created_by;
  final int rptd_document_type;
  final String rptd_content;
  PatientDocumentsBillingData({required this.rptd_id,
    required this.documentName,
    required this.fk_pt_id,
    required this.rptd_url, required this.rptd_created_at, required this.rptd_created_by, required this.rptd_document_type,
    required this.rptd_content});
}
///patient document F2f
class PatientDocumentsFtwoFData{
  final int rptd_id;
  final int fk_pt_id;
  final String rptd_url;
  final String documentName;
  final String rptd_created_at;
  final int rptd_created_by;


  PatientDocumentsFtwoFData({required this.rptd_id,
    required this.documentName,
    required this.fk_pt_id,
    required this.rptd_url, required this.rptd_created_at, required this.rptd_created_by,});
}
///patient document Consent
class PatientDocumentsConsentData{
  final int rptd_id;
  final int fk_pt_id;
  final String rptd_url;
  final String documentName;
  final String rptd_created_at;
  final int rptd_created_by;
  final int rptd_document_type;
  final String rptd_content;

  PatientDocumentsConsentData({required this.rptd_id,
    required this.documentName,
    required this.fk_pt_id,
    required this.rptd_url, required this.rptd_created_at, required this.rptd_created_by, required this.rptd_document_type,
    required this.rptd_content});
}