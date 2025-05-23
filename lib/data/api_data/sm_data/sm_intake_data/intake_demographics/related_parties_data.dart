class EmergencyContactData{
  final int contactId;
  final int fk_pt_id;
  final String firstName;
  final String lastName;
  final int fk_Relationship;
  final String street;
  final String suite;
  final String city;
  final String state;
  final String zipCode;
  final String phoneNumber;
  final String email;

  EmergencyContactData({
    required this.contactId, required this.fk_pt_id, required this.firstName,
    required this.lastName, required this.fk_Relationship, required this.street,
    required this.suite, required this.city, required this.state, required this.zipCode,
    required this.phoneNumber, required this.email});
}

class PatientRepresentativeData{
  final int representiveId;
  final int fk_pt_id;
  final String firstName;
  final String lastName;
  final int fk_Relationship;
  final String street;
  final String suite;
  final String city;
  final String state;
  final String zipCode;
  final String phoneNumber;
  final String email;
  final int RoleId;
  final int typeId;

  PatientRepresentativeData({
    required this.representiveId, required this.fk_pt_id, required this.firstName,
    required this.lastName, required this.fk_Relationship, required this.street,
    required this.suite, required this.city, required this.state, required this.zipCode,
    required this.phoneNumber, required this.email,required this.RoleId,required this.typeId});
}