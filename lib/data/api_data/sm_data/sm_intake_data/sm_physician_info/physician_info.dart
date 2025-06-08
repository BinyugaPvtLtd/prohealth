class PhysicianInfoPrefillData {
  final int phyId;
  final String phyFirstName;
  final String phyLastName;
  final String? phySuffix;
  final String phyPicoNo;
  final bool phyPicoStatus;
  final String phyEmail;
  final String phyContact;
  final String? phyStreet;
  final String? phySuite;
  final String? phyCity;
  final String? phyState;
  final String? phyZipCode;
  final String? phyFax;
  final int? phyNPI;
  final String? phyUPI;
  final String? phyProtocols;
  final String? phyNotes;
  final bool? phyVerified;
  final String? phyVerificationDetails;
  final String? phyTrackingNotes;

  PhysicianInfoPrefillData({
    required this.phyId,
    required this.phyFirstName,
    required this.phyLastName,
    required this.phyPicoNo,
    required this.phyPicoStatus,
    required this.phyEmail,
    required this.phyContact,
    this.phySuffix,
    this.phyStreet,
    this.phySuite,
    this.phyCity,
    this.phyState,
    this.phyZipCode,
    this.phyFax,
    this.phyNPI,
    this.phyUPI,
    this.phyProtocols,
    this.phyNotes,
    this.phyVerified,
    this.phyVerificationDetails,
    this.phyTrackingNotes,
  });
}
