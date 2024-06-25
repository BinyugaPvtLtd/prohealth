class AllFromHrRepository{
  ///Clinical
  static String empType = "/employee-types";
  static String companyDept = "/company-department";
  static String department = "/Department";

  static String getEmployeeType(){
    return "$empType";
  }
  static String getEmployeeTypeDeptWise({required int deptId}){
    return "$empType$department/$deptId";
  }
  static String getHrType(){
    return "$companyDept";
  }
  static String patchHRType({required int empId}){
    return "$empType/$empId";
  }
  static String getEmpTypeById({required int empId}){
    return "$empType/$empId";
  }
}

///zone
class AllZoneRepository{
  static String zone = "/zone";
  static String county = "/county";
  static String zipcodesetup = "/zipcode-setup";

  static String zoneGet(){
    return "$zone";
  }
  static String deleteZipCodeSetup({required int zipCodeSetupId}){
    return "$zipcodesetup/$zipCodeSetupId";
  }
  /// get
  static String zoneBYcompOfficeGet({required int companyId,required String officeId,required int pageNo,required int noOfRow}){
    return "$zone/$companyId/$officeId/$pageNo/$noOfRow";
  }
  ///county get last
  static String countyGet({required int companyId,required String officeId,required int pageNo,required int noOfRow}){
    return "$county/$companyId/$officeId/$pageNo/$noOfRow";
  }
  static String deleteCounty({required int countyId}){
    return "$county/$countyId";
  }
  ///zipcode,zone get
  static String zipcodeSetupGet({required int companyId,required String officeId,required int pageNo,required int noOfRow}){
    return "$zipcodesetup/$companyId/$officeId/$pageNo/$noOfRow";
  }

}