///onboarding-qualification-employement
class OnboardingQualificationEmploymentData {
  final int employmentId;
  final int empId;
  final String employer;
  final String city;
  final String reason;
  final String supervisor;
  final String supMobile;
  final String title;
  final String dateOfJoin;
  final String endDate;
  bool approve;
  OnboardingQualificationEmploymentData(
      {required this.employmentId,
      required this.empId,
      required this.employer,
      required this.city,
      required this.reason,
      required this.supervisor,
      required this.supMobile,
      required this.title,
      required this.dateOfJoin,
      required this.endDate,
      required this.approve});
}

///onboarding-qualification-education
class OnboardingQualificationEducationData {
  final int educationId;
  final int empId;
  final String graduate;
  final String degree;
  final String major;
  final String city;
  final String college;
  final String phone;
  final String state;
  bool approve;

  OnboardingQualificationEducationData(
      {required this.educationId,
        required this.empId,
        required this.graduate,
        required this.degree,
        required this.major,
        required this.city,
        required this.college,
        required this.phone,
        required this.state,
        required this.approve});
}

///onboarding-qualification-referance
class OnboardingQualificationReferanceData {
  final int referenceId;
  final int empId;
  final String association;
  final String comment;
  final String company;
  final String email;
  final String mob;
  final String name;
  final String references;
  final String title;
  bool approve;

  OnboardingQualificationReferanceData(
      {required this.referenceId,
        required this.empId,
        required this.association,
        required this.comment,
        required this.company,
        required this.email,
        required this.mob,
        required this.name,
        required this.references,
        required this.title,
        required this.approve});
}

///onboarding-qualification-licence
class OnboardingQualificationLicenseData {
  final int licenseId;
  final int empId;
  final String country;
  final String expDate;
  final String issueDate;
  final String licenseUrl;
  final String licensure;
  final String licenseNumber;
  final String org;
  final String documentType;
  bool approve;

  OnboardingQualificationLicenseData(
      {required this.licenseId,
        required this.empId,
        required this.country,
        required this.expDate,
        required this.issueDate,
        required this.licenseUrl,
        required this.licensure,
        required this.licenseNumber,
        required this.org,
        required this.documentType,
        required this.approve});
}
