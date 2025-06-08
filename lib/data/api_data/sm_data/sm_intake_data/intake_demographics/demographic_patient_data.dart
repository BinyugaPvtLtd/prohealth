class DemographicPatientDataModel {
  final int demoId;
  final int fkPtId;
  final String demoFirstName;
  final String demoMiddleInitial;
  final String demoLastName;
  final String demoSuffix;
  final String demoStreet;
  final String demoSuite;
  final String demoCity;
  final String demoState;
  final String demoZipcode;
  final int fkCountryId;
  final String countyName;
  final int fkResidenceTypeId;
  final String fkResidenceTypeName;
  final String demoFacilityName;
  final int fkZoneId;
  final String zoneName;
  final String demoLocationNotes;
  final String demoPrimaryContact;
  final String demoPrimaryContactName;
  final String demoPrimaryPhone;
  final String demoPrimaryEmail;
  final String demoCahpsContact;
  final String demoSecondaryContact;
  final String demoSecondaryContactName;
  final String demoSecondaryPhone;
  final String demoSecondaryEmail;
  final String demoDob;
  final int fkGender;
  final String genderName;
  final int fkSpokenLanguage;
  final String spokenLanguageName;
  final String demoSocialSecurity;
  final int fkRaceEthnicity;
  final String RaceEthniname;
  final int fkMaritalStatus;
  final String maritalStatusName;
  final String demoCreatedAt;

  DemographicPatientDataModel({required this.countyName, required this.fkResidenceTypeName,
      required this.zoneName, required this.genderName, required this.spokenLanguageName,
      required this.RaceEthniname, required this.maritalStatusName,
    required this.demoId,
    required this.fkPtId,
    required this.demoFirstName,
    required this.demoMiddleInitial,
    required this.demoLastName,
    required this.demoSuffix,
    required this.demoStreet,
    required this.demoSuite,
    required this.demoCity,
    required this.demoState,
    required this.demoZipcode,
    required this.fkCountryId,
    required this.fkResidenceTypeId,
    required this.demoFacilityName,
    required this.fkZoneId,
    required this.demoLocationNotes,
    required this.demoPrimaryContact,
    required this.demoPrimaryContactName,
    required this.demoPrimaryPhone,
    required this.demoPrimaryEmail,
    required this.demoCahpsContact,
    required this.demoSecondaryContact,
    required this.demoSecondaryContactName,
    required this.demoSecondaryPhone,
    required this.demoSecondaryEmail,
    required this.demoDob,
    required this.fkGender,
    required this.fkSpokenLanguage,
    required this.demoSocialSecurity,
    required this.fkRaceEthnicity,
    required this.fkMaritalStatus,
    required this.demoCreatedAt,
  });
}


