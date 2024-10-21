class LegalDocumentsRepo{
  static String onCallDocument = "/call-html";
  static String covidTestDocument = "/covid-test-policy-html";
  static String ConfidentialStatementDocument = "/confidentiality-statement-html";
  static String reportingAbuseDocument = "/reporting-abuse";
  static String candidateReleaseDocument = "/candidate-release-form";
  static String policyConcerningDocument = "/policy-concerning-third-party";
  static String standardConductDocument = "/standards-of-conduct";
  static String sexualHaressmentDocument = "/california-sexual-harassment";
  static String sexualAndUnlawfulDocument = "/sexual-and-other-unlawful/template";
  static String preAuthPatientVisitsDocument = "/pre-authorized-patient-visits";
  static String pro65Document = "/prop-65";
  static String returnOfCompanyDocument = "/return-of-company-property";
  static String hepBDocument = "/hep-b-declination-form";
  static String tDapDocument = "/tdap-declination-form";
  static String proHealthCellPhoneStatement = "/pro-health-cell-phone-usage-statement";
  static String covidVaccineDocument = "/february-covid-vaccination-policy-mandatory";
  static String htmlFormTemplateSignatureAdd = "/form-html-templates-status/add/employee/form/Signatures";
  static String directDepositDocument = "/direct-deposit/generate-template";
  static String proHealthEmployeeHandbookDocument = "/pro-health-employee-handbook";
  static String fluVaccineDocument = "  /flu-vaccine-form/{dateOfvaccination}/{siteOfAdministration}/{dose}/{manufacturer}/{dateofVaccination}/{nameOfAdministering}/{title}/{providerAddress}/{acknowledgeFacts}/{Allergis}";



  ///users/ByCompanyId/{companyId}
  static String getOnCallDocument({required int callHtmlId,required int employeeId}){
    return "$onCallDocument/$callHtmlId/$employeeId";
  }
  static String getCandidateReleaseDocument({required int candidateReleaseFormhtmlId,required int employeeId,required String middleName, required String maindenSurnameAlisa,
    required String currentAddress,required String stateIssuingLicense, required String fullname}){
    return "$candidateReleaseDocument/$candidateReleaseFormhtmlId/$employeeId/$middleName/$maindenSurnameAlisa/$currentAddress/$stateIssuingLicense/$fullname";
  }
  static String getCovidTestPolicyDocument({required int covidTestId,required int employeeId}){
    return "$covidTestDocument/$covidTestId/$employeeId";
  }
  static String getConfidentialStatementDocument({required int confidentialId,required int employeeId}){
    return "$ConfidentialStatementDocument/$confidentialId/$employeeId";
  }
  static String getreportingAbuseDocument({required int reportingAbuseId,required int employeeId}){
    return "$reportingAbuseDocument/$reportingAbuseId/$employeeId";
  }
  static String getpolicyConcerningDocument({required int policyConcerningId,required int employeeId}){
    return "$policyConcerningDocument/$policyConcerningId/$employeeId";
  }
  static String getStandardConductDocument({required int standardConductId,required int employeeId}){
    return "$standardConductDocument/$standardConductId/$employeeId";
  }
  static String getSexualHaressmentDocument({required int templateId,required int employeeId}){
    return "$sexualHaressmentDocument/$templateId/$employeeId";
  }
  static String getSexualAndUnlawfulDocument({required int templateId,required int employeeId}){
    return "$sexualAndUnlawfulDocument/$templateId/$employeeId";
  }
  static String getPreAuthPatientVisitsDocument({required int templateId,required int employeeId}){
    return "$preAuthPatientVisitsDocument/$templateId/generate-html/$employeeId";
  }
  static String getPro65Document({required int templateId,required int employeeId}){
    return "$pro65Document/$templateId/generate-html/$employeeId";
  }
  static String getReturnOfCompanyDocument({required int templateId,required int employeeId, required String companyProperty,
    required String specifications, required String supervisorName}){
    return "$returnOfCompanyDocument/$templateId/generate-html/$employeeId/$companyProperty/$specifications/$supervisorName";
  }
  static String getHepBDocument({required int templateId,required int employeeId}){
    return "$hepBDocument/$templateId/generate-html/$employeeId";
  }
  static String getTDapDocument({required int templateId,required int employeeId}){
    return "$tDapDocument/$templateId/generate-html/$employeeId";
  }
  static String getCovidVaccineDocument({required int templateId,required int employeeId}){
    return "$covidVaccineDocument/$templateId/generate-html/$employeeId";
  }
  static String getDirectDepositDocument({required int templateId,required int employeeId,required String action1,
    required String type1, required String bankNameAndAddress1,
    required String routingOrtransit1,required String account1,required String amount1,
    required String action2,required String type2,required String bankNameAndaddress2,required String routingOrtransit2,
    required String account2 , required String amount2 }){
    return "$directDepositDocument/$templateId/$employeeId/$action1/$type1/$bankNameAndAddress1/$routingOrtransit1/$account1/$amount1/$action2/$type2/$bankNameAndaddress2/$routingOrtransit2/$account2/$amount2";
  }
  static String getProHealthCellPhoneStatement({required int templateId,required int employeeId}){
    return "$proHealthCellPhoneStatement/$templateId/generate-html/$employeeId";
  }
  static String postHemlTemplateFormSignature(){
    return "$htmlFormTemplateSignatureAdd";
  }
  static String getProHealthEmployeeHandbook({required int handBookId,required int employeeId}){
    return "$proHealthEmployeeHandbookDocument/$handBookId/$employeeId";
  }
  static String getFluVaccineDocument({required int templateId,required int employeeId,required String dateOfVaccine,required String siteOfAdministration, required String vaccineType, required String dose,
   required String reactions, required String manufacturer, required String dateofVaccination, required String nameOfAdministering, required String title, required String providerAddress, required String acknowledgeFacts, required String Allergis}){
    return "$fluVaccineDocument/$templateId/generate-html/$employeeId/$dateOfVaccine/$siteOfAdministration/$dose/$manufacturer/$dateofVaccination/$dateofVaccination/$nameOfAdministering/$title/$providerAddress/$acknowledgeFacts/$Allergis";
  }
}
