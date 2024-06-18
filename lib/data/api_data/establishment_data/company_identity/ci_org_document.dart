class CiOrgDocumentCC {
  final int? docId;
  final String? name;
  final String? expiry;
  final String? reminderThreshold;
  final String? createdAt;
  final bool sucess;
  final String message;

  CiOrgDocumentCC(
      {required this.sucess,
      required this.message,
      this.createdAt,
      this.docId,
      this.name,
      this.expiry,
      this.reminderThreshold});
}

class OrgDocModal {
  final int? docId;
  final String? name;
  final String? expiry;
  final String? reminderThreshold;
  final String? createdAt;
  final bool sucess;
  final String message;

  OrgDocModal(
      {required this.sucess,
      required this.message,
      this.createdAt,
      this.docId,
      this.name,
      this.expiry,
      this.reminderThreshold});
}

class IdentityData {
  final int companyId;
  final int docId;
  final int docSubId;
  final int pageNo;
  final int rowsNo;
  final bool sucess;
  final String message;

  IdentityData({required this.sucess, required this.message,
    required this.companyId,
    required this.docId,
    required this.docSubId,
    required this.pageNo,
    required this.rowsNo,
  });
}

/// document type
class DocumentTypeData{
  final int docID;
  final String docType;
  final bool sucess;
  final String message;
  DocumentTypeData({required this.docID, required this.docType, required this.sucess, required this.message,});
}

/// identity document type
class IdentityDocumentIdData{
  final int docID;
  final String docType;
  final int subDocID;
  final String subDocType;
  final bool sucess;
  final String message;
  IdentityDocumentIdData({required this.docID, required this.docType, required this.subDocID, required this.subDocType, required this.sucess, required this.message,});
}