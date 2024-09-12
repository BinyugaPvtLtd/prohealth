class TypeofDocpopup {
  final int orgDocumentSetupid;
  final int documenttypeid;
  final int documentsubtypeid;
  final String docname;
  final String expirytype;
  final int threshold;
  final String expirydate;
  final String expiryreminder;
  final int companyid;
  final String idOfDocument;
  final bool? hasIssuerExpiry;

  TypeofDocpopup({
    required this.orgDocumentSetupid,
    required this.documenttypeid,
    required this.documentsubtypeid,
    required this.docname,
    required this.expirytype,
    required this.threshold,
    required this.expirydate,
    required this.expiryreminder,
    required this.companyid,
    required this.idOfDocument,
    this.hasIssuerExpiry,
  });
}

class MCorporateComplianceModal {
  final int orgOfficeDocumentId;
  final int orgDocumentSetupid;
  final String idOfDocument;
  final String doc_created_at;
  final String expiry_date;
  final String url;
  final int companyId;
  final String officeId;

  MCorporateComplianceModal(
  {
    required this.orgOfficeDocumentId,
    required this.orgDocumentSetupid,
    required this.idOfDocument,
    required this.doc_created_at,
    required this.expiry_date,
    required this.url,
    required this.companyId,
    required this.officeId
});
}




//////

class NewOrgDocumentManage {
  final int orgOfficeDocumentId;
  final int orgDocumentSetupid;
  final String idOfDocument;
  final String expirydate;
  final String doccreatedat;
  final int companyid;
  final String url;
  final String officeid;

  NewOrgDocumentManage(
      {required this.orgOfficeDocumentId,
      required this.orgDocumentSetupid,
      required this.idOfDocument,
      required this.expirydate,
      required this.doccreatedat,
      required this.companyid,
      required this.url,
      required this.officeid});
}