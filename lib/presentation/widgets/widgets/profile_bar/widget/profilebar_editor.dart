import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/common_resources/common_theme_const.dart';
import 'package:prohealth/app/resources/establishment_resources/establish_theme_manager.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/company_identrity_manager.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/google_aotopromt_api_manager.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/add_employee/clinical_manager.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/progress_form_manager/form_general_manager.dart';
import 'package:prohealth/app/services/api/repository/hr_module_repository/manage_emp/gender_api.dart';
import 'package:prohealth/data/api_data/hr_module_data/add_employee/clinical.dart';
import 'package:prohealth/data/api_data/hr_module_data/manage/gender_data.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/widgets/error_popups/failed_popup.dart';
import 'package:prohealth/presentation/widgets/error_popups/four_not_four_popup.dart';
import 'package:prohealth/presentation/widgets/widgets/constant_textfield/const_textfield.dart';
import 'package:prohealth/presentation/widgets/widgets/profile_bar/widget/profile_bar_editor_popup.dart';
import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/establishment_manager/manage_details_manager.dart';
import '../../../../../app/services/api/managers/hr_module_manager/profile_mnager.dart';
import '../../../../../app/services/api/managers/hr_module_manager/register_manager/register_manager.dart';
import '../../../../../data/api_data/establishment_data/ci_manage_button/manage_details_data.dart';
import '../../../../../data/api_data/establishment_data/company_identity/company_identity_data_.dart';
import '../../../../../data/api_data/establishment_data/zone/zone_model_data.dart';
import '../../../../../data/api_data/hr_module_data/profile_editor/profile_editor.dart';
import '../../../../screens/em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../../screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import 'add_coverage_popup.dart';

class ProfileEditScreen extends StatefulWidget {
  final VoidCallback onCancel;
  final int employeeId;

  ProfileEditScreen({
    required this.onCancel,
    required this.employeeId,
  });

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String? selectedDepartment;
  String? selectedGender;
  String? selectedZone;
  String? selectedCounty;
  String? selectedSSn;
  String? selectedServices;
  String? selectedEmployeType;
  String? selectedReportingOffice;
  DateTime? selectedDate;
  List<DropdownMenuItem<String>> dropDownList = [];
  int selectedZoneId = 0;
  int selectedCountyId = 0;
  int selectedCityId = 0;
  String reportingOfficeId ='';
  String genderId ='';
  Map<String, bool> checkedZipCodes = {};
  Map<String, bool> checkedCityName = {};
  List<String> selectedZipCodes = [];
  List<String> selectedCityName = [];
  String selectedZipCodesString = '';
  var deptId = 1;
  int? firstDeptId;
  String? selectedDeptName;
  int? selectedDeptId;
  String? selectedServiceName;
  String? serviceId;
  TextEditingController dummyCtrl = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController empTypeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ssNController = TextEditingController();
  TextEditingController workPhoneController = TextEditingController();
  TextEditingController phoneNController = TextEditingController();
  TextEditingController personalEmailController = TextEditingController();
  TextEditingController workEmailController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController countyController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController reportingOfficeController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  List<DropdownMenuItem<String>> countyDropDownList = [];
  List<DropdownMenuItem<String>> zoneDropDownList = [];
  String selectedCovrageCounty = "Select County";
  String selectedCovrageZone = "Select Zone";
  String? selectedServiceId;
  String? selectedOfficeId;
  String? selectedGenderId;
  bool _isLoading = false;
  String? selectedEmployeeColor;
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    _addListeners();
  }

  void _addListeners() {
    List<TextEditingController> controllers = [
      nameController,
      addressController,
      ageController,
      ssNController,
      workPhoneController,
      phoneNController,
      personalEmailController,
      workEmailController,
      summaryController,
    ];

    for (var controller in controllers) {
      controller.addListener(_checkIfAllFieldsFilled);
    }
  }

  void _checkIfAllFieldsFilled() {
    bool allFilled = _areAllFieldsFilled();

    if (_isButtonEnabled.value != allFilled) {
    //  print("🔄 Updating button state: $allFilled");
      _isButtonEnabled.value = allFilled;
    }
  }

  bool _areAllFieldsFilled() {
   // print("Checking if all fields are filled...");

    bool allFilled = nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        ssNController.text.isNotEmpty &&
        workPhoneController.text.isNotEmpty &&
        phoneNController.text.isNotEmpty &&
        personalEmailController.text.isNotEmpty &&
        workEmailController.text.isNotEmpty &&
        summaryController.text.isNotEmpty;
    //
    // if (!allFilled) {
    //   print("Some fields are empty:");
    //   if (nameController.text.isEmpty) print("nameController is empty");
    //   if (addressController.text.isEmpty) print("addressController is empty");
    //   if (ageController.text.isEmpty) print("ageController is empty");
    //   if (ssNController.text.isEmpty) print("ssNController is empty");
    //   if (workPhoneController.text.isEmpty) print("workphonecontroller is empty");
    //   if (phoneNController.text.isEmpty) print("phoneNController is empty");
    //   if (personalEmailController.text.isEmpty) print("personalEmailController is empty");
    //   if (workEmailController.text.isEmpty) print("workEmailController is empty");
    //   if (summaryController.text.isEmpty) print("summaryController is empty");
    // } else {
    //   print("✅ All fields are filled!");
    // }

    return allFilled;
  }

  @override
  void dispose() {
    // Dispose controllers
    _isButtonEnabled.dispose();
    nameController.dispose();
    deptController.dispose();
    empTypeController.dispose();
    addressController.dispose();
    ageController.dispose();
    genderController.dispose();
    ssNController.dispose();
    workPhoneController.dispose();
    phoneNController.dispose();
    personalEmailController.dispose();
    workEmailController.dispose();
    zoneController.dispose();
    countyController.dispose();
    serviceController.dispose();
    reportingOfficeController.dispose();
    summaryController.dispose();
    super.dispose();
  }

  void _ppp(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddSuccessPopup(message: 'Employee updated successfully');

      },
    );
  }
  List<int> zipCodes = [];
  String? selectedZipCodeZone;
  int docZoneId = 0;
  bool pickedFilePath = false;
  dynamic finalPath;
  String fileName = '';
  int selectedEmployeeTypeId =0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
      body: FutureBuilder<ProfileEditorModal>(
            future: getEmployeePrefill(context, widget.employeeId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching profile data'),
                );
              }

              if (snapshot.hasData) {
                var profileData = snapshot.data!;
                // WidgetsBinding.instance.addPostFrameCallback((_) {
                //   if (nameController.text.isEmpty) nameController.text = profileData.firstName ?? '';
                //   if (deptController.text.isEmpty) deptController.text = profileData.department ?? '';
                //   if (empTypeController.text.isEmpty) empTypeController.text = profileData.employeType ?? '';
                //   if (addressController.text.isEmpty) addressController.text = profileData.finalAddress ?? '';
                //   if (ageController.text.isEmpty) ageController.text = profileData.dateOfBirth ?? '';
                //   if (genderController.text.isEmpty) genderController.text = profileData.gender ?? '';
                //   if (ssNController.text.isEmpty) ssNController.text = profileData.SSNNbr ?? '';
                //   if (workPhoneController.text.isEmpty) workPhoneController.text = profileData.workPhoneNbr ?? '';
                //   if (phoneNController.text.isEmpty) phoneNController.text = profileData.primaryPhoneNbr ?? '';
                //   if (personalEmailController.text.isEmpty) personalEmailController.text = profileData.personalEmail ?? '';
                //   if (workEmailController.text.isEmpty) workEmailController.text = profileData.workEmail ?? '';
                //   if (zoneController.text.isEmpty) zoneController.text = profileData.zone ?? '';
                //   if (countyController.text.isEmpty) countyController.text = profileData.county ?? '';
                //   if (serviceController.text.isEmpty) serviceController.text = profileData.service ?? '';
                //   if (reportingOfficeController.text.isEmpty) reportingOfficeController.text = profileData.regOfficId ?? '';
                //   if (summaryController.text.isEmpty) summaryController.text = profileData.summary ?? '';
                // });
                ///
                nameController.text = profileData.firstName ?? '';
                deptController.text = profileData.department ?? '';
                empTypeController.text = profileData.employeType ?? '';
                addressController.text = profileData.finalAddress ?? '';
                ageController.text = profileData.dateOfBirth ?? '';
                genderController.text = profileData.gender ?? '';
                ssNController.text = profileData.SSNNbr ?? '';
                workPhoneController.text = profileData.workPhoneNbr ?? '';
                phoneNController.text = profileData.primaryPhoneNbr ?? '';
                personalEmailController.text = profileData.personalEmail ?? '';
                workEmailController.text = profileData.workEmail ?? '';
                zoneController.text = profileData.zone ?? '';
                countyController.text = profileData.county ?? '';
                serviceController.text = profileData.service ?? '';
                reportingOfficeController.text = profileData.regOfficId ?? '';
                summaryController.text = profileData.summary ?? '';
                selectedEmployeeColor = profileData.color;
                selectedDeptName = profileData.department;
                selectedDeptId = profileData.departmentId;
                print('Profile image ${profileData.imgurl}');
                String countyName = "";
                String zoneName = "";
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: ColorManager.bluebottom, width: 8.0), // Top blue border
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Bottom shadow
                              offset: const Offset(0, 4),
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),

                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   border: Border.all(color: Colors.grey, width: 1.0),
                        //   // border: Border.symmetric(vertical: BorderSide( color: Colors.grey,
                        //   //   width: 1.0,),
                        //   // ),
                        //   borderRadius: BorderRadius.circular(20.0),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: ColorManager.bluebottom,
                        //       // color: Colors.blue.withOpacity(0.5),
                        //       offset: const Offset(0, -4),
                        //       // blurRadius: 8.0,
                        //       spreadRadius: 1.0,
                        //     ),
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       offset: const Offset(0, 4),
                        //       spreadRadius: 1.0,
                        //     ),
                        //   ],
                        // ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                    children: [Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ///
                                        ///
                                        ///
                                        ///
                                        ///
                                        Padding(
                                          padding: const EdgeInsets.only(right: 23,top:10),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left:18),
                                                child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [StatefulBuilder(
                                                      builder: (BuildContext context, void Function(void Function()) setState) {
                                                        return Padding(
                                                          padding: const EdgeInsets.only(right:20),
                                                          child: Row(
                                                            children: [
                                                              pickedFilePath
                                                                  ? Container(
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors.black.withOpacity(0.2),
                                                                      spreadRadius: 2,
                                                                      blurRadius: 5,
                                                                      offset: const Offset(0, 3), // Shadow position
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: CircleAvatar(
                                                                  radius: 30,
                                                                  child: ClipOval(
                                                                    child: Image.memory(
                                                                      finalPath!,
                                                                      fit: BoxFit.cover,
                                                                      width: double.infinity,
                                                                      height: double.infinity,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                                  : profileData.imgurl == null
                                                                  ? const Text('')
                                                                  : Container(
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                ),
                                                                child: CircleAvatar(
                                                                  radius: 30, // Adjust the size of the avatar
                                                                  backgroundColor: ColorManager.faintGrey,
                                                                  child: ClipOval(
                                                                    child: Image.network(
                                                                      profileData.imgurl,
                                                                      fit: BoxFit.cover, // Ensures the image fills the avatar
                                                                      width: double.infinity, // Ensures the image fills the avatar width
                                                                      height: double.infinity, // Ensures the image fills the avatar height
                                                                      loadingBuilder: (context, child, loadingProgress) {
                                                                        if (loadingProgress == null) {
                                                                          return child;
                                                                        } else {
                                                                          return const CircularProgressIndicator();
                                                                        }
                                                                      },
                                                                      errorBuilder: (context, error, stackTrace) {
                                                                        return CircleAvatar(
                                                                          radius: 30,
                                                                          child: Image.asset("images/profilepic.png", fit: BoxFit.cover),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(width: 10),
                                                              // Custom icon button for uploading files
                                                              CustomIconButton(
                                                                icon: Icons.upload_outlined,
                                                                text: AppString.photo,
                                                                onPressed: () async {
                                                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                                                    allowMultiple: true,
                                                                    type: FileType.custom, // Custom type to specify allowed extensions
                                                                    allowedExtensions: [
                                                                      'png',
                                                                      'jpg',
                                                                      'jpeg',
                                                                    ],
                                                                  );
                                                                  if (result != null) {
                                                                    print("Result::: ${result}");

                                                                    try {
                                                                      setState(() {
                                                                        pickedFilePath = true;
                                                                        fileName = result.files.first.name;
                                                                        finalPath = result.files.first.bytes; // Store the picked file bytes
                                                                      });
                                                                      print('File picked: ${fileName}');
                                                                    } catch (e) {
                                                                      print(e);
                                                                    }
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),]
                                                ),
                                              ),
                                              StatefulBuilder(
                                                builder: (BuildContext context, void Function(void Function()) setState) {
                                                  return Row(
                                                    children: [
                                                      ProfileEditCancelButton(
                                                        height: AppSize.s30,
                                                        width: AppSize.s100,
                                                        text: AppString.cancel,
                                                        onPressed: () {
                                                          print("Edit Mode Cancel :::::::::::::::::::::::############");
                                                          widget.onCancel();
                                                        },
                                                      ),
                                                      SizedBox(width: 10,),

                                                      isLoading ?SizedBox(
                                                        height: AppSize.s30,
                                                        width: AppSize.s30,
                                                        child: CircularProgressIndicator(
                                                          color: ColorManager.blueprime,
                                                        ),
                                                      )
                                                          :ValueListenableBuilder<bool>(
                                                        valueListenable: _isButtonEnabled,
                                                          builder: (context, isEnabled, child) {
                                                            return  CustomButton(
                                                              height: AppSize.s30,
                                                              width: AppSize.s100,
                                                              onPressed: isEnabled
                                                             ? () async {
                                                                BuildContext dialogContext = context;
                                                            setState(() {
                                                              isLoading = true;
                                                            });
                                                            try {
                                                              // print("name ${nameController.text}" );
                                                              // print("empID ${selectedEmployeeTypeId}" );
                                                              // print("SSN ${ssNController.text}" );
                                                              // print("PhoneN ${phoneNController.text}" );
                                                              // print("workPhone ${workPhoneController.text}" );
                                                              // print("personal email ${personalEmailController.text}" );
                                                              // print("work email ${workEmailController.text}" );
                                                              // print("address ${addressController.text}" );
                                                              // print("summary ${summaryController.text}" );
                                                              //
                                                              // print("dept ${selectedDeptId}" );
                                                              // print("office id ${selectedOfficeId}" );
                                                              // print("service id ${selectedServiceId}" );
                                                              // print("gender id ${selectedGenderId}" );
                                                              // print("age ${ageController.text}" );
                                                              var response = await patchEmployeeEdit(
                                                                  context: dialogContext,
                                                                  filePicked: pickedFilePath,
                                                                  pickedFilepath: finalPath,
                                                                  pickedFileName: fileName,
                                                                  employeeId: widget.employeeId,
                                                                  code: profileData.code,
                                                                  userId: profileData.userId,
                                                                  firstName: nameController.text,
                                                                  lastName: profileData.lastName,
                                                                  departmentId: profileData.departmentId,
                                                                  employeeTypeId:selectedEmployeeTypeId,
                                                                  expertise: profileData.speciality,
                                                                  cityId: profileData.cityId,
                                                                  countryId: profileData.countryId,
                                                                  countyId: profileData.countyId,
                                                                  zoneId: profileData.zoneId,
                                                                  SSNNbr: ssNController.text,
                                                                  primaryPhoneNbr: phoneNController.text,
                                                                  secondryPhoneNbr: profileData.secondryPhoneNbr,
                                                                  workPhoneNbr: workPhoneController.text,
                                                                  regOfficId: selectedOfficeId ?? profileData.regOfficId,
                                                                  personalEmail: personalEmailController.text,
                                                                  workEmail: workEmailController.text,
                                                                  address: addressController.text,
                                                                  dateOfBirth: profileData.dateOfBirth == ageController.text ? profileData.dateOfBirth.toString() : ageController.text,
                                                                  emergencyContact: profileData.emergencyContact,
                                                                  covreage: profileData.covreage,
                                                                  employment: profileData.employment,
                                                                  gender: selectedGenderId ?? genderController.text,
                                                                  status: profileData.status,
                                                                  service: selectedServiceId ?? profileData.service,
                                                                  summary: summaryController.text,
                                                                  imgurl: profileData.imgurl,
                                                                  resumeurl: profileData.resumeurl,
                                                                  onboardingStatus: profileData.onboardingStatus,
                                                                  driverLicenceNbr: profileData.driverLicenceNbr,
                                                                  dateofTermination: profileData.dateofTermination,
                                                                  dateofResignation: profileData.dateofResignation,
                                                                  dateofHire: profileData.dateofHire,
                                                                  rehirable: profileData.rehirable,
                                                                  position: profileData.position,
                                                                  finalAddress: addressController.text,
                                                                  type: profileData.type,
                                                                  reason: profileData.reason,
                                                                  finalPayCheck: profileData.finalPayCheck,
                                                                  checkDate: profileData.checkDate,
                                                                  grossPay: profileData.grossPay,
                                                                  netPay: profileData.netPay,
                                                                  methods: profileData.methods,
                                                                  materials: profileData.materials,
                                                                  race: profileData.race,
                                                                  rating: profileData.rating,
                                                                  signatureURL: profileData.signatureURL,
                                                                  colorCode: selectedEmployeeColor!,
                                                                  departmentName: selectedDeptName!
                                                              );

                                                              if (response.statusCode == 200 || response.statusCode == 201) {
                                                                print("File Value ::::::::::::: ${pickedFilePath}");
                                                                _ppp();
                                                                // if (pickedFilePath && finalPath != null) {
                                                                //   print("Uploading file: $finalPath for employeeId: ${widget.employeeId}");
                                                                //   await UploadEmployeePhoto(
                                                                //     context: dialogContext,
                                                                //     documentFile: finalPath,
                                                                //     employeeId: widget.employeeId,
                                                                //   );
                                                                //   print("File upload completed.");
                                                                // }
                                                                //   if(context.mounted){
                                                                //     showDialog(
                                                                //     context: context,
                                                                //     builder: (BuildContext context) {
                                                                //       return const AddSuccessPopup(message: 'Employee updated successfully');
                                                                //     },
                                                                //     );
                                                                //   }
                                                                  widget.onCancel();
                                                                //}

                                                              }
                                                              //
                                                              // if(response.statusCode == 200 || response.statusCode == 201){
                                                              //   // var patchCoverage = await patchEmpEnrollAddCoverage(context,profileData.employeeEnrollId,widget.employeeId,addCovrage);
                                                              //   if(dialogContext.mounted) {
                                                              //     widget
                                                              //         .onCancel();
                                                              //     showDialog(
                                                              //       context: dialogContext,
                                                              //       builder: (
                                                              //           BuildContext context) {
                                                              //         return const AddSuccessPopup(
                                                              //           message: 'Employee updated successfully',
                                                              //         );
                                                              //       },
                                                              //     );
                                                              //     print(
                                                              //        "File Value ::::::::::::: ${pickedFilePath}");
                                                              //     if (pickedFilePath) {
                                                              //       var uploadResponse = await UploadEmployeePhoto(
                                                              //           context: dialogContext,
                                                              //           documentFile: finalPath,
                                                              //           employeeId: widget
                                                              //               .employeeId);
                                                              //     }
                                                              //     else {
                                                              //       print(
                                                              //           'Document Error');
                                                              //     }
                                                              //   }
                                                              // }
                                                              else if(response.statusCode == 400 || response.statusCode == 404){
                                                                // Navigator.pop(context);
                                                                showDialog(
                                                                  context: dialogContext,
                                                                  builder: (BuildContext context) => const FourNotFourPopup(),
                                                                );
                                                              }
                                                              else {
                                                                //Navigator.pop(context);
                                                                showDialog(
                                                                  context: dialogContext,
                                                                  builder: (BuildContext context) => FailedPopup(text: response.message),
                                                                );
                                                              }
                                                              widget.onCancel();
                                                              nameController.clear();
                                                              deptController.clear();
                                                              empTypeController.clear();
                                                              addressController.clear();
                                                              ageController.clear();
                                                              ssNController.clear();
                                                              phoneNController.clear();
                                                              workPhoneController.clear();
                                                              personalEmailController.clear();
                                                              workEmailController.clear();
                                                              countyController.clear();
                                                              serviceController.clear();
                                                              zoneController.clear();
                                                              summaryController.clear();
                                                            } catch (e) {
                                                              print(e);
                                                            }
                                                            setState(() {
                                                              isLoading = false;
                                                              // Start timer
                                                            });
                                                               }
                                                             : null,
                                                                text: 'Save',
                                                            );
                                                            }
                                                          ),
                                                    ],
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 25,),
                                        ///upload file
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 18),
                                              child: Text(
                                                AppString.editProfile,
                                                style: EditProfile.customEditTextStyle(),
                                              ),
                                            ),

                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        /// row 1 work 1
                                        Padding(
                                          padding: const EdgeInsets.only(left:18,right:23),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              FirstSMTextFConst(
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                text: AppString.name,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: "Select Employee Type", // Main text
                                                      style: AllPopupHeadings.customTextStyle(context), // Main style
                                                      children: [
                                                        TextSpan(
                                                          text: ' *', // Asterisk
                                                          style: AllPopupHeadings.customTextStyle(context).copyWith(
                                                            color: ColorManager.red, // Asterisk color
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5,),
                                                  FutureBuilder<List<AEClinicalDiscipline>>(
                                                    future: HrAddEmplyClinicalDisciplinApi(context, deptId),
                                                    builder: (context, snapshot) {
                                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                                        return Container(
                                                          alignment: Alignment.center,
                                                          child: HRUManageDropdown(
                                                            controller: TextEditingController(text: ''),
                                                            labelFontSize: 12,
                                                            items: [], // Empty while loading
                                                          ),
                                                        );
                                                      }
                                                      if (snapshot.hasData && snapshot.data!.isEmpty) {
                                                        return HRUManageDropdown(
                                                          controller: TextEditingController(text: ''),
                                                          labelFontSize: 12,
                                                          items: [],
                                                        );
                                                      }

                                                      if (snapshot.hasData) {
                                                        List<AEClinicalDiscipline> employeeTypeList = snapshot.data!;
                                                        List<String> dropDownEmployeeTypes = employeeTypeList
                                                            .map((employeeType) => employeeType.empType!)
                                                            .toList();

                                                        String? selectedEmployeeType = profileData.employeType;
                                                        print('Employee type ${profileData.employeType}');

                                                        selectedEmployeeTypeId = profileData.employeeTypeId;

                                                        return HRUManageDropdown(
                                                          controller: TextEditingController(text: profileData.employeType),
                                                          labelFontSize: 12,
                                                          items: dropDownEmployeeTypes,
                                                          onChanged: (val) {
                                                            selectedEmployeeType = val;
                                                            selectedEmployeeTypeId = employeeTypeList
                                                                .firstWhere((employeeType) => employeeType.empType == val)
                                                                .employeeTypesId;
                                                            selectedEmployeeColor = employeeTypeList
                                                                .firstWhere((employeeType) => employeeType.empType == val)
                                                                .color;
                                                            print('Selected Employee Type Color: $selectedEmployeeColor');
                                                            print('Selected Employee Type ID: $selectedEmployeeTypeId');
                                                          },
                                                        );
                                                      }
                                                      return const SizedBox();
                                                    },
                                                  ),
                                                ],
                                              ),
                                              FirstSMTextFConst(
                                                controller: TextEditingController(
                                                    text: profileData.department),
                                                keyboardType: TextInputType.text,
                                                text: 'Department',
                                                enable:false
                                              ),
                                            ],
                                          ),
                                        ),
                                        ///row 2 work 1
                                        Padding(
                                          padding: const EdgeInsets.only(left:18,right: 23),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              AddressInput(
                                                controller: addressController,
                                                onSuggestionSelected: (selectedSuggestion) {
                                                  // Handle the selected suggestion here
                                                  print("Selected suggestion: $selectedSuggestion");
                                                }, onChanged: (String ) {  },
                                              ),

                                              FirstSMTextFConst(
                                                controller: ageController,
                                                keyboardType: TextInputType.text,
                                                text: 'DOB',
                                                showDatePicker: true,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: "Gender", // Main text
                                                      style: AllPopupHeadings.customTextStyle(context), // Main style
                                                      children: [
                                                        TextSpan(
                                                          text: ' *', // Asterisk
                                                          style: AllPopupHeadings.customTextStyle(context).copyWith(
                                                            color: ColorManager.red, // Asterisk color
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  FutureBuilder<List<GenderData>>(
                                                    future: getGenderDropdown(context),
                                                    builder: (context, snapshot) {
                                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                                        return HRUManageDropdown(
                                                          hintText: "",
                                                          // width: 320,
                                                          // height: 40,
                                                          controller: TextEditingController(text: ''),
                                                          items: ['item 1', 'item 2'],

                                                          labelFontSize: 12,
                                                        );
                                                      }
                                                      if (snapshot.hasData) {
                                                        List<String> dropDownList = [];
                                                        for (var i in snapshot.data!) {
                                                          dropDownList.add(i.gender);
                                                        }
                                                        return HRUManageDropdown(
                                                          hintText: "Gender",
                                                          labelFontSize: 12,
                                                          items: dropDownList,
                                                          onChanged: (newValue) {
                                                            for (var a in snapshot.data!) {
                                                              if (a.gender == newValue) {
                                                                selectedGenderId = a.gender;
                                                                print('Gender Name : ${genderId}');
                                                                // int docType = a.employeeTypesId;
                                                                // Do something with docType
                                                              }
                                                            }
                                                          },  controller: TextEditingController(text: profileData.gender),
                                                        );
                                                      } else {
                                                        return const Offstage();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        ///row 3 work
                                        Padding(
                                          padding: const EdgeInsets.only(left:18,right: 23),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SSNTextFConst(
                                                controller: ssNController,
                                                keyboardType: TextInputType.number,
                                                text: AppString.ssnProfile,
                                              ),

                                              SMTextFConstPhone(
                                                controller: phoneNController,
                                                keyboardType: TextInputType.phone,
                                                text: AppString.phone_number,
                                              ),
                                              SMTextFConstPhone(
                                                controller: workPhoneController,
                                                keyboardType: TextInputType.text,
                                                text:  AppStringMobile.worNo,
                                              ),
                                            ],
                                          ),
                                        ),
                                        /// row 4 work
                                        Padding(
                                          padding: const EdgeInsets.only(left:18,right:23),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SMTextFConst(
                                                controller: personalEmailController,
                                                keyboardType: TextInputType.text,
                                                text: AppStringMobile.perEmail,
                                                // showDatePicker: true,
                                              ),

                                              SMTextFConst(
                                                controller: workEmailController,
                                                keyboardType: TextInputType.text,
                                                text: AppStringMobile.worEmail,
                                                // showDatePicker: true,
                                              ),
                                              FirstSMTextFConst(
                                                controller: summaryController,
                                                keyboardType: TextInputType.text,
                                                text: AppStringMobile.summry,
                                                // showDatePicker: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        ///row 5
                                        Padding(
                                          padding: const EdgeInsets.only(left:18,right:23),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: "Select Service", // Main text
                                                      style: AllPopupHeadings.customTextStyle(context), // Main style
                                                      children: [
                                                        TextSpan(
                                                          text: ' *', // Asterisk
                                                          style: AllPopupHeadings.customTextStyle(context).copyWith(
                                                            color: ColorManager.red, // Asterisk color
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5,),
                                                  FutureBuilder<List<ServicesMetaData>>(
                                                    future: getServicesMetaData(context),
                                                    builder: (context, snapshot) {
                                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                                        return HRUManageDropdown(
                                                          hintText: '',
                                                          controller: TextEditingController(text: ''),
                                                          items: [], labelFontSize: 12,
                                                        );
                                                      }

                                                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                                                        List<String> serviceNames = snapshot.data!.map((service) => service.serviceName).toList();

                                                        return HRUManageDropdown(
                                                          controller: TextEditingController(text:profileData.service),
                                                          hintText: 'Select Service',
                                                          items: serviceNames,
                                                          onChanged: (val) {
                                                            var selectedService = snapshot.data!
                                                                .firstWhere((service) => service.serviceName == val);
                                                            selectedServiceId = selectedService.serviceName;
                                                            print('Selected Service ID: ${selectedService.serviceId}');
                                                          },
                                                          labelFontSize: 12 ,
                                                        );
                                                      }

                                                      return const Text('No services available');
                                                    }, ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: "Reporting Office", // Main text
                                                      style: AllPopupHeadings.customTextStyle(context), // Main style
                                                      children: [
                                                        TextSpan(
                                                          text: ' *', // Asterisk
                                                          style: AllPopupHeadings.customTextStyle(context).copyWith(
                                                            color: ColorManager.red, // Asterisk color
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  FutureBuilder<List<CompanyOfficeListData>>(
                                                    future: getCompanyOfficeList(context),
                                                    builder: (context, snapshot) {
                                                      if (snapshot.connectionState ==
                                                          ConnectionState.waiting) {
                                                        return HRUManageDropdown(
                                                          hintText: "Reporting Office",
                                                          controller: TextEditingController(text:""),
                                                          items: ['item 1', 'item 2'],
                                                          labelFontSize: 12,
                                                        );
                                                      }
                                                      if (snapshot.hasData) {
                                                        List<String> dropDownList = [];
                                                        for (var i in snapshot.data!) {
                                                          dropDownList.add(i.name);
                                                        }
                                                        return HRUManageDropdown(
                                                          hintText: "Reporting Office",
                                                          // labelStyle: const TextStyle(
                                                          //   fontSize: 12,
                                                          //   color: Color(0xff575757),
                                                          //   fontWeight: FontWeight.w400,
                                                          // ),
                                                          labelFontSize: 12,
                                                          items: dropDownList,
                                                          onChanged: (newValue) {
                                                            for (var a in snapshot.data!) {
                                                              if (a.name == newValue) {
                                                                selectedOfficeId = a.name;
                                                                print('Office Name : ${reportingOfficeId}');
                                                                // int docType = a.employeeTypesId;
                                                                // Do something with docType
                                                              }
                                                            }
                                                          },  controller: TextEditingController(text:profileData.regOfficId),
                                                        );
                                                      } else {
                                                        return const Offstage();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:354,
                                                    height:30,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15,),
                                        ///coverage head
                                        StatefulBuilder(
                                          builder: (BuildContext context, void Function(void Function()) setState) {
                                            return  Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 10.0, left: 18,bottom: 5),
                                                      child: Container(
                                                        height: 20,
                                                        width:354,
                                                        //color: ColorManager.red,
                                                        child: Text(
                                                            "Coverage",
                                                            style: AllPopupHeadings.customTextStyle(context)
                                                        ),
                                                        // color: Colors.green,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ///Coverage
                                                FutureBuilder <EmployeeModel>(
                                                    future: getCoverageList(context: context, employeeId: widget.employeeId,
                                                        employeeEnrollId:profileData.employeeEnrollId ),
                                                    builder: (context ,snapshot){
                                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                                        return const Center(
                                                          child: CircularProgressIndicator(),
                                                        );
                                                      }
                                                      if (snapshot.hasError) {
                                                        return const Center(
                                                          child: Text('Error fetching profile data'),
                                                        );
                                                      }
                                                      if (snapshot.hasError) {
                                                        return Center(
                                                            child: Padding(
                                                              padding:const EdgeInsets.symmetric(vertical: 100),
                                                              child: Text(
                                                                "No available coverage!",
                                                                style: CustomTextStylesCommon.commonStyle(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: FontSize.s14,
                                                                    color: ColorManager.mediumgrey),
                                                              ),
                                                            ));
                                                      }


                                                      if (snapshot.hasData){
                                                        return Container(
                                                          width: MediaQuery.of(context).size.width / 1,
                                                          child: Wrap(
                                                            spacing: 3.0,
                                                            children: List.generate((snapshot.data!.coverageDetails.length), (index) {
                                                              // int firstItemIndex = index * 2;
                                                              // int secondItemIndex = firstItemIndex + 1;
                                                              return Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 5),
                                                                child: CoverageRowWidget(
                                                                    countyName: snapshot.data!.coverageDetails[index].countyName,
                                                                    zoneName: snapshot.data!.coverageDetails[index].zoneName,
                                                                    onDelete: () {
                                                                      showDialog(
                                                                        context: context,
                                                                        builder: (context) => DeletePopup(
                                                                            title: DeletePopupString.deleteCoverage,
                                                                            loadingDuration: _isLoading,
                                                                            onCancel: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            onDelete: () async {
                                                                              setState(() {
                                                                                _isLoading = true;
                                                                              });
                                                                              try {
                                                                                await deleteCoverageEditor(context, snapshot.data!.coverageDetails[index].employeeEnrollCoverageId);
                                                                                setState(() {
                                                                                  getCoverageList(context: context, employeeId: widget.employeeId,
                                                                                      employeeEnrollId:profileData.employeeEnrollId );

                                                                                });
                                                                              } finally {
                                                                                setState(() {
                                                                                  _isLoading = false;
                                                                                  Navigator.pop(context);
                                                                                });
                                                                              }
                                                                            }),
                                                                      );
                                                                    },
                                                                    onEdit: () {
                                                                      showDialog(
                                                                        context: context,
                                                                        builder: (BuildContext context) {
                                                                          return FutureBuilder(
                                                                            future: getCoveragePreFill(context: context, employeeId: widget.employeeId,
                                                                                employeeEnrollCoverageId: snapshot.data!.coverageDetails[index].employeeEnrollCoverageId),
                                                                            builder: (context,snapshotPreFill) {
                                                                              if(snapshotPreFill.connectionState == ConnectionState.waiting){
                                                                                return Center(
                                                                                    child: CircularProgressIndicator(color: ColorManager.blueprime,),
                                                                                );
                                                                              }

                                                                              var coverageDetails = snapshotPreFill.data!.coverageDetails;
                                                                              // Print the values being passed to the ProfileBarEditPopup
                                                                              print(">>>>>Employee ID: ${profileData.employeeId}");
                                                                              print(">>>>>Employee Enroll ID: ${profileData.employeeEnrollId}");
                                                                              print(">>>>>Employee Enroll Coverage ID: ${snapshot.data!.coverageDetails[index].employeeEnrollCoverageId}");
                                                                              print(">>>>>County Name: ${coverageDetails.countyName}");
                                                                              print(">>>>>Zone Name: ${coverageDetails.zoneName}");
                                                                              print(">>>>>Zone ID: ${coverageDetails.zoneId}");
                                                                              print(">>>>>County ID: ${coverageDetails.countyId}");
                                                                              print(">>>>>//Zip Codes: ${coverageDetails.zipCodes}");
                                                                              print(">>>>>//:??????????????????????????????????????????????????");


                                                                              return ProfileBarEditPopup(employeeId: profileData.employeeId,
                                                                                employeeEnrollId: profileData.employeeEnrollId,
                                                                                employeeEnrollCoverageId: snapshot.data!.coverageDetails[index].employeeEnrollCoverageId,
                                                                                onRefresh: () {
                                                                                  setState((){
                                                                                    getCoverageList(context: context, employeeId: widget.employeeId,
                                                                                        employeeEnrollId:profileData.employeeEnrollId );
                                                                                  });
                                                                                }, countyNameValue: snapshotPreFill.data!.coverageDetails.countyName,
                                                                                zoneNameValue: snapshotPreFill.data!.coverageDetails.zoneName,
                                                                                zoneId: snapshotPreFill.data!.coverageDetails.zoneId,
                                                                                countyId: snapshotPreFill.data!.coverageDetails.countyId,
                                                                                zipCode: snapshotPreFill.data!.coverageDetails.zipCodes,);
                                                                            }
                                                                          );
                                                                        },
                                                                      );
                                                                    }
                                                                ),

                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      }
                                                      else{
                                                        return const SizedBox();
                                                      }
                                                    }),
                                                const SizedBox(height: 20,),
                                                ///add coverage
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: (){showDialog(
                                                          context: context,
                                                          builder: (BuildContext context)=> ProfileBarAddPopup(employeeId: widget.employeeId,employeeEnrollId: profileData.employeeEnrollId,
                                                            onRefresh: () {
                                                              setState((){
                                                                getCoverageList(context: context, employeeId: widget.employeeId,
                                                                    employeeEnrollId:profileData.employeeEnrollId );
                                                              });
                                                            },));} ,

                                                      child: Container(
                                                          height: 40,
                                                          width: 200,
                                                          //color: Colors.red,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(14),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.add_circle,
                                                                  size: 26,
                                                                  color: ColorManager.bluebottom,
                                                                ),
                                                                const SizedBox(width: 3,),
                                                                Text(
                                                                  'Add Coverage',
                                                                  style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s15,
                                                                    fontWeight: FontWeight.w700,
                                                                    color: ColorManager.bluebottom,),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    ]
                                ),
                                const SizedBox(height: 20,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: Text('No data available'),
              );
            },
          ),
    );
  }
}///
///
///
///
///
///


class CoverageRowWidget extends StatelessWidget {
  final String countyName;
  final String zoneName;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const CoverageRowWidget({
    Key? key,
    required this.countyName,
    required this.zoneName,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width/2.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: ColorManager.blueprime,
          width: 2,
        ),
        // color: ColorManager.red
      ),
      padding: EdgeInsets.only( left: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "County :",
                    style: AllPopupHeadings.customTextStyle(context),
                  ),
                )),
          ),
          SizedBox(width: 1,),
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    countyName,
                    style: EditTextFontStyle.customEditTextStyle(),
                  ),
                ],)),
          SizedBox(width: 5,),
          Expanded(
              flex: 1,
              child: Text(
                "Zones :",
                style: AllPopupHeadings.customTextStyle(context),
              )),
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    zoneName,
                    style: EditTextFontStyle.customEditTextStyle(),
                  ),
                ],)),
          const SizedBox(width: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(Icons.edit_outlined, color: ColorManager.bluebottom, size: IconSize.I16),
                onPressed: onEdit,
              ),
              const SizedBox(width: 3),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: const Icon(Icons.delete, color: Colors.red, size: IconSize.I16),
                onPressed: onDelete,
              ),
            ],),
        ],
      ),
    );
  }
}



// class CoverageRowWidget extends StatelessWidget {
//   final String countyName;
//   final String zoneName;
//   final VoidCallback onDelete;
//   final VoidCallback onEdit;
//
//   const CoverageRowWidget({
//     Key? key,
//     required this.countyName,
//     required this.zoneName,
//     required this.onDelete,
//     required this.onEdit,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: MediaQuery.of(context).size.width/2.6,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(
//             color: ColorManager.blueprime,
//             width: 2,
//           ),
//          // color: ColorManager.red
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Text(
//                   "County :",
//                   style: AllPopupHeadings.customTextStyle(context),
//                 ),
//               )),
//           SizedBox(width: 1,),
//           Expanded(
//               flex: 3,
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//             Text(
//               countyName,
//               style: EditTextFontStyle.customEditTextStyle(),
//             ),
//           ],)),
//           SizedBox(width: 5,),
//           Expanded(
//               flex: 2,
//               child: Text(
//                 "Zone :",
//                 style: AllPopupHeadings.customTextStyle(context),
//               )),
//           SizedBox(width: 1,),
//           Expanded(
//               flex: 3,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     zoneName,
//                     style: EditTextFontStyle.customEditTextStyle(),
//                   ),
//                 ],)),
//           const SizedBox(width: 5),
//           Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//           IconButton(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             hoverColor: Colors.transparent,
//             icon: Icon(Icons.edit_outlined, color: ColorManager.bluebottom, size: 15),
//             onPressed: onEdit,
//           ),
//           const SizedBox(width: 3),
//           IconButton(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             hoverColor: Colors.transparent,
//             icon: const Icon(Icons.delete, color: Colors.red, size: 15),
//             onPressed: onDelete,
//           ),
//                       ],),
//         ],
//       ),
//     );
//   }
// }


class EditProfile {
  static TextStyle customEditTextStyle() {
    return TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeight.w700,
      // : FontWeight.w500,
      color: ColorManager.blueprime,
      // decoration: TextDecoration.none,
    );
  }
}


class Coverage {
  static TextStyle customEditTextStyle() {
    return TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeight.w700,
      // : FontWeight.w500,
      color: ColorManager.blueprime,
      // decoration: TextDecoration.none,
    );
  }
}

class EditTextFontStyle {
  static TextStyle customEditTextStyle() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ColorManager.mediumgrey,
    );
  }
}

class ProfileEditCancelButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double width;
  final double height;
  final TextStyle? style;
  final Widget? child;
  ProfileEditCancelButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF50B5E5),
    this.textColor = const Color(0xFF50B5E5),
    this.borderRadius = 14.0,
    this.paddingVertical = 12.0,
    this.paddingHorizontal = 16.0,
    this.width = 50,
    this.height = 50.0,
    this.style,
    this.child,
  });

  // bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final defaultTextStyle =  CustomTextStylesCommon.commonStyle( color: textColor,
      fontSize: FontSize.s14,
      fontWeight: FontWeight.w600,);
    final mergedTextStyle = defaultTextStyle.merge(style);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          const BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            backgroundColor: ColorManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFF50B5E5)),
            ),
          ),
          child:
          Text(text!, textAlign: TextAlign.center, style: mergedTextStyle)),
    );
  }
}

class AddressInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onSuggestionSelected;
  final Function(String) onChanged;// Callback to notify parent

  AddressInput({required this.controller, this.onSuggestionSelected, required this.onChanged});

  @override
  _AddressInputState createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  List<String> _suggestions = [];
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onCountyNameChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onCountyNameChanged);
    _removeOverlay();
    super.dispose();
  }

  void _onCountyNameChanged() async {
    final query = widget.controller.text;
    if (query.isEmpty) {
      _suggestions.clear();
      _removeOverlay();
      return;
    }

    final suggestions = await fetchSuggestions(query);
    setState(() {
      _suggestions = suggestions.isNotEmpty && suggestions[0] != query ? suggestions : [];
    });
    _showOverlay();
  }

  void _showOverlay() {
    _removeOverlay();

    if (_suggestions.isEmpty) return;

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
          children:[
            GestureDetector(
              onTap: _removeOverlay,
              child: Container(
                color: Colors.transparent, // Make this transparent so it's invisible
              ),
            ),Positioned(
              left: position.dx,
              top: position.dy + renderBox.size.height,
              width: 354,
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: _suggestions.length > 5 ? 80.0 : double.infinity,
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _suggestions[index],
                            style: TableSubHeading.customTextStyle(context),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            widget.controller.text = _suggestions[index];
                            _suggestions.clear();
                            _removeOverlay();

                            // Call the callback with the selected suggestion
                            if (widget.onSuggestionSelected != null) {
                              widget.onSuggestionSelected!(_suggestions[index]);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FirstSMTextFConst(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      text: AppString.addresss,
    );
  }
}
///department dropdown
// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     // RichText(
//     //   text: TextSpan(
//     //     text: "Select Department", // Main text
//     //     style: AllPopupHeadings.customTextStyle(context), // Main style
//     //     children: [
//     //       TextSpan(
//     //         text: ' *', // Asterisk
//     //         style: AllPopupHeadings.customTextStyle(context).copyWith(
//     //           color: ColorManager.red, // Asterisk color
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // ),
//    // Text('Select Department', style: AllPopupHeadings.customTextStyle(context)),
//     SizedBox(height: 5,),
//
//     // FutureBuilder<List<HRHeadBar>>(
//     //   future: companyHRHeadApi(context, deptId),
//     //   builder: (context, snapshot) {
//     //     if (snapshot.connectionState ==
//     //         ConnectionState.waiting) {
//     //       List<String>dropDownServiceList =[];
//     //       return Container(
//     //           alignment: Alignment.center,
//     //           child:
//     //           HRUManageDropdown(
//     //             controller: TextEditingController(
//     //                 text: ''),
//     //             //labelText: 'Select Department',
//     //             // labelStyle:CustomTextStylesCommon.commonStyle( fontSize: 12,
//     //             //   color: Color(0xff575757),
//     //             //   fontWeight: FontWeight.w500,),
//     //             labelFontSize: 12,
//     //             items:  dropDownServiceList,
//     //
//     //           )
//     //       );
//     //     }
//     //     if (snapshot.hasData &&
//     //         snapshot.data!.isEmpty) {
//     //       return Center(
//     //         child: Text(
//     //           ErrorMessageString.noroleAdded,
//     //           style: CustomTextStylesCommon.commonStyle(
//     //             fontWeight: FontWeight.w500,
//     //             fontSize: FontSize.s14,
//     //             color: ColorManager.mediumgrey,
//     //           ),
//     //         ),
//     //       );
//     //     }
//     //     if (snapshot.hasData) {
//     //
//     //       // Extract dropdown items from snapshot
//     //       List<String> dropDownServiceList = snapshot
//     //           .data!
//     //           .map((dept) => dept.deptName!)
//     //           .toList();
//     //       String? firstDeptName =
//     //       snapshot.data!.isNotEmpty
//     //           ? snapshot.data![0].deptName
//     //           : null;
//     //       int? firstDeptId = snapshot.data!.isNotEmpty
//     //           ? snapshot.data![0].deptId
//     //           : null;
//     //
//     //       if (selectedDeptName == null &&
//     //           dropDownServiceList.isNotEmpty) {
//     //         // selectedDeptName = firstDeptName;
//     //         // selectedDeptId = firstDeptId;
//     //       }
//     //
//     //       return HRUManageDropdown(
//             controller: TextEditingController(
//                 text: profileData.department),
//     //         //labelText: "Select Department",
//     //         // labelStyle:CustomTextStylesCommon.commonStyle( fontSize: 12,
//     //         //   color: const Color(0xff575757),
//     //         //   fontWeight: FontWeight.w500,),
//     //         labelFontSize: 12,
//     //         items: dropDownServiceList,
//     //         onChanged: (val) {
//     //           // setState(() {
//     //           selectedDeptName = val;
//     //           selectedDeptId = snapshot.data!
//     //               .firstWhere(
//     //                   (dept) => dept.deptName == val)
//     //               .deptId;
//     //           // });
//     //         },
//     //       );
//     //     }
//     //     return const SizedBox();
//     //   },
//     // ),
//   ],
// ),


///suggestion
// if (_suggestions.isNotEmpty)
//   Positioned(
//     top: 55,
//     right: 60,
//     child: Container(
//       height: 100,
//       width: 300,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: _suggestions.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//               _suggestions[index],
//               style: TableSubHeading.customTextStyle(context),
//             ),
//             onTap: () {
//               FocusScope.of(context)
//                   .unfocus(); // Dismiss the keyboard
//               String selectedSuggestion = _suggestions[index];
//               addressController.text = selectedSuggestion;
//
//               setState(() {
//                 _suggestions.clear();
//                 //_suggestions.removeWhere((suggestion) => suggestion == selectedSuggestion);
//               });
//             },
//           );
//         },
//       ),
//     ),
//   ),

