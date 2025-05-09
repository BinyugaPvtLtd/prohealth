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
  final String rptd_created_at;
  final int rptd_created_by;

  PatientDocumentsData({required this.rptd_id,
    required this.fk_pt_id,
    required this.rptd_url, required this.rptd_created_at, required this.rptd_created_by,});
}