import 'package:prohealth/app/resources/color.dart';

/// Company Model
class CompanyModel {
  final String? name;
  final String? address;
  final String? officeName;
  final int? companyId;

  CompanyModel({this.officeName,
    this.companyId,
    this.name,
    this.address,
  });
}

/// Company Logo Model
class CompanyLogoModel {
  final int? logoId;
  final String? type;

  CompanyLogoModel({this.logoId, this.type});
}

/// Company Upload Logo Model
class UploadCompanyLogoModel {
  final int? companyId;
  final String? type;

  UploadCompanyLogoModel(
      {
      this.companyId,
      this.type});
  // Map<String, dynamic> toJson() {
  //   return {
  //     'company_id': companyId,
  //     'type': type,
  //   };
  // }
}
