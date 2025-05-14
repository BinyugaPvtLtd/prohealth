import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'package:prohealth/data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_integration_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/patient_insurances_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/referral_service_data.dart';
import '../../../../../widgets/error_popups/delete_success_popup.dart';
import '../../../../em_module/company_identity/widgets/manage_history_version.dart';
import '../../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../../em_module/manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import '../../../../em_module/widgets/button_constant.dart';
import '../../../../hr_module/onboarding/download_doc_const.dart';
import '../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:flutter/material.dart';


class DiagnosisProvider extends ChangeNotifier {
  int _patientId = 0;
  int get patientId => _patientId;
  String _fileName = '';
  dynamic _filePath;
  bool _fileAbove20Mb = false;

  dynamic get filePath => _filePath;
  String get fileName => _fileName;
  bool get fileAbove20Mb => _fileAbove20Mb;

  void passPatientId({required int patientIdNo}){
    _patientId = patientIdNo;
    notifyListeners();
  }
  void passPatientIdClear(){
    _patientId = 0;
    notifyListeners();
  }


  List<GlobalKey<_DiagosisListState>> _diagnosisKeys = [];
  List<PatientDiagnosesModel> _diagnosisData = []; // Holds initial API data
  bool _isVisible = false;

  List<GlobalKey<_DiagosisListState>> get diagnosisKeys => _diagnosisKeys;
  List<PatientDiagnosesModel> get diagnosisData => _diagnosisData;
  bool get isVisible => _isVisible;

  void pickPatientFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png','jpg'],
    );
    final fileSize = result?.files.first.size; // File size in bytes
    final isAbove20MB = fileSize! > (20 * 1024 * 1024); // 20MB in bytes
    if (result != null) {
      _filePath = result.files.first.bytes;
      _fileName = result.files.first.name;
      _fileAbove20Mb = !isAbove20MB;
      notifyListeners();
    }
  }
  void loadDiagnosisFromApi(List<PatientDiagnosesModel> apiData) {
    _diagnosisKeys.clear();
    _diagnosisData = apiData;
    for (var _ in apiData) {
      _diagnosisKeys.add(GlobalKey<_DiagosisListState>());
    }
    notifyListeners();
  }

  void addDiagnosis() {
    _diagnosisKeys.add(GlobalKey<_DiagosisListState>());

    // _diagnosisData.add(DiagnosisModel(dgnId: 0, dgnName: '', dgnCode: '')); // empty data
    notifyListeners();
  }

  void removeDiagnosis(GlobalKey<_DiagosisListState> key) {
    int index = _diagnosisKeys.indexOf(key);
    if (index != -1) {
      _diagnosisKeys.removeAt(index);
      _diagnosisData!.removeAt(index);
      notifyListeners();
    }
  }

  void setVisibility(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}

class ReferalPendingEyePageview extends StatefulWidget {
  final VoidCallback onGoBackPressed;
  const ReferalPendingEyePageview({super.key, required this.onGoBackPressed});

  @override
  State<ReferalPendingEyePageview> createState() =>
      _ReferalPendingEyePageviewState();
}

class _ReferalPendingEyePageviewState extends State<ReferalPendingEyePageview> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController patientsController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController patientsSummary = TextEditingController();
  TextEditingController referredfor = TextEditingController();
  TextEditingController policy = TextEditingController();
  TextEditingController plan = TextEditingController();
  TextEditingController provider = TextEditingController();
  TextEditingController possiblePrime = TextEditingController();
  TextEditingController icdPrime = TextEditingController();
  TextEditingController pdgmPrime = TextEditingController();
  //TextEditingController patientsSummary = TextEditingController();
  String selectedType = "Insurance";
  bool isChecked = false;
  List<bool> isCheckedList = List.generate(5, (index) => false); // Initialize list with false
  String? selectedFileName;

  bool nursing = true;
  bool physicalTherapy = true;
  bool occupationalTherapy = true;
  bool speechTherapy = false;
  bool medicalSocialServices = false;
  bool homeHealthAide = true;
  bool dietician = false;
  void _pickFile() async {

  }
  var Nursing = '';
  var PhysicalTherapy = '';
  var OccupationalTherapy = '';
  var SpeechTherapy = '';
  var MedicalSocialServices = '';
  var HomeHealthAide = '';
  var Dietician = '';

  @override
  void initState() {
    super.initState();
    loadInitialDiagnosis();
    loadInitialinsurance();
  }
  List<PatientInsurancesData> patientInsurance = [];
  List<EmployeeClinicalData> employeeClinicalData = [];

  Future<void> loadInitialDiagnosis() async {
    final provider = Provider.of<DiagnosisProvider>(context, listen: false);
    PatientModel apiData = await getPatientReffrealsDataUsingId(context: context, patientId: provider.patientId); // ← Your API call
    provider.loadDiagnosisFromApi(apiData.patientDiagnoses);
    provider.setVisibility(true);
  }

  Future<void> loadInitialinsurance() async {
    patientInsurance = await getReffrealsPatientInsurance(context: context,);
    employeeClinicalData = await getEmployeeClinicalInReffreals(context: context);// ← Your API call
  }


  double _sliderValue = 100; // initial value
  int patientInsuranceId = 0;
  final StreamController<List<PatientDocumentsData>> _streamController = StreamController<List<PatientDocumentsData>>.broadcast();
  // Stream<PatientModel> getPatientReffrealsDataStream({required BuildContext context, required int patientId}) {
  //   return Stream.periodic(Duration(seconds: 5)).asyncMap(
  //         (_) => getPatientReffrealsDataUsingId(context: context, patientId: patientId),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // final providerAddState = Provider.of<DiagnosisProvider>(context);
    bool _isLoading = false;
    return  Consumer<DiagnosisProvider>(
      builder: (context,providerAddState,child) {
        return FutureBuilder<PatientModel>(
          future: getPatientReffrealsDataUsingId(context: context, patientId: providerAddState.patientId),
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 76),
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.blueprime,
                  ),
                ),
              );
            }
            var firstName = snapshot.data!.ptFirstName;
            var lastName = snapshot.data!.ptLastName;
            var patientPhone = snapshot.data!.ptContactNo;
            var zipCodePatient = snapshot.data!.ptZipCode;
            var patientSummery = snapshot.data!.ptSummary;
            // var icdNo = snapshot.data!.primaryDiagnosis.dgnCode;
            // var posibleDignosis = snapshot.data!.primaryDiagnosis.dgnName;
            //var refferFor = snapshot.data.referralSource.
            firstNameController = TextEditingController(text:snapshot.data!.ptFirstName);
            lastNameController = TextEditingController(text:snapshot.data!.ptLastName);
            patientsController = TextEditingController(text:snapshot.data!.ptContactNo);
            zipCodeController = TextEditingController(text:snapshot.data!.ptZipCode);
            patientsSummary = TextEditingController(text:snapshot.data!.ptSummary);
            // icdPrime = TextEditingController(text:snapshot.data!.primaryDiagnosis.dgnCode);
            // possiblePrime = TextEditingController(text:snapshot.data!.primaryDiagnosis.dgnName);
           // referredfor = TextEditingController(text: snapshot.data!.service.srvName);
            List<String> desciplineModel = [];
            List<String> desciplineModelAbbrivation = [];
            List<String> desciplineModelAbbrivationColor = [];
            List<int> desciplineintList = [];
            for(var a in snapshot.data!.disciplines){
              desciplineModel.add(a.employeeType);
              desciplineintList.add(a.employeeTypeId);
              desciplineModelAbbrivation.add(a.abbreviation);
              desciplineModelAbbrivationColor.add(a.color);
            }
            patientInsuranceId = snapshot.data!.fk_rpti_id;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
              child:  ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                          border: Border(
                            top: BorderSide(
                              color: ColorManager.blueprime,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: InkWell(
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: widget.onGoBackPressed,
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: IconSize.I16,
                                          color: ColorManager.mediumgrey,

                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex:3,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ClipOval(
                                        child: snapshot.data!.ptImgUrl == 'imgurl' ||
                                            snapshot.data!.ptImgUrl == null
                                            ? CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset("images/profilepic.png"),
                                        )
                                            : Image.network(
                                          snapshot.data!.ptImgUrl!,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress.expectedTotalBytes != null
                                                      ? loadingProgress.cumulativeBytesLoaded /
                                                      (loadingProgress.expectedTotalBytes ?? 1)
                                                      : null,
                                                ),
                                              );
                                            }
                                          },
                                          errorBuilder: (context, error, stackTrace) {
                                            return CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.transparent,
                                              child: Image.asset("images/profilepic.png"),
                                            );
                                          },
                                          fit: BoxFit.cover,
                                          height: 45,
                                          width: 45,
                                        ),
                                      ),
                                      Text(
                                       "${snapshot.data!.ptFirstName} ${snapshot.data!.ptLastName}",
                                        textAlign: TextAlign.center,
                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                                          fontWeight: FontWeight.w700,
                                          color: ColorManager.black,),
                                      ),
                                      Text(
                                        "Ch #1",
                                        textAlign: TextAlign.center,
                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorManager.mediumgrey,),
                                      ),
                                      Text(
                                        "Received Date: ${snapshot.data!.ptRefferalDate}  | ${ snapshot.data!.ptTime}",
                                        textAlign: TextAlign.center,
                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorManager.mediumgrey,),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(width: 50,),
                            Expanded(
                                flex:4,
                                child: Container(
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 30,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Referral Date :  ",
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text(
                                                snapshot.data!.ptRefferalDate,
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Primary Diagnosis: ",
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text(
                                                snapshot.data!.patientDiagnoses.isEmpty ? "--":
                                                snapshot.data!.patientDiagnoses[0].dgnName,
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex:4,
                                child: Container(
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 30,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Referral Source: ",
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text(
                                                snapshot.data!.referralSource.sourceName,
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "PCP:  ",
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text(
                                                "${snapshot.data!.pcp.phyFirstName} ${snapshot.data!.pcp.phyFirstName}",
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex:4,
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 12),
                                  child: Row(
                                  children: [
                                    Text("Marketer: ",style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.mediumgrey,),),
                                    SizedBox(width: AppSize.s25),
                                    ClipOval(
                                      child: snapshot.data!.ptImgUrl == 'imgurl' ||
                                          snapshot.data!.ptImgUrl == null
                                          ? CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        child: Image.asset("images/profilepic.png"),
                                      )
                                          : Image.network(
                                        snapshot.data!.marketer.imgurl,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress.expectedTotalBytes != null
                                                    ? loadingProgress.cumulativeBytesLoaded /
                                                    (loadingProgress.expectedTotalBytes ?? 1)
                                                    : null,
                                              ),
                                            );
                                          }
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.transparent,
                                            child: Image.asset("images/profilepic.png"),
                                          );
                                        },
                                        fit: BoxFit.cover,
                                        height: 45,
                                        width: 41,
                                      ),
                                    ),
                                    SizedBox(width: AppSize.s15),
                                    Text(
                                      "${snapshot.data!.marketer.firstName} ${snapshot.data!.marketer.lastName}",
                                      textAlign: TextAlign.center,
                                      style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                        fontWeight: FontWeight.w700,
                                        color: ColorManager.mediumgrey,),
                                    ),
                                    SizedBox(width: AppSize.s7),
                                    ],
                                ),)),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s20,),
                      ///patients info
                      BlueBGHeadConst(HeadText: "Patient Information"),
                      SizedBox(height: AppSize.s20,),
                      Row(
                        children: [
                          SizedBox(width: AppSize.s25,),
                          Expanded(
                            child: SMTextFConst(controller: firstNameController,
                                isAsteric: false,
                                onChangeField: (value){
                                  updateReferralPatient(context: context,
                                      patientId: providerAddState.patientId,
                                      isUpdatePatiendData: true,firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      contactNo: patientsController.text,
                                      summary: patientsSummary.text,
                                      zipCode: zipCodeController.text,
                                      serviceId: snapshot.data!.fkSrvId,
                                      disciplineIds: desciplineintList,
                                      insuranceId: patientInsuranceId);
                                },
                                keyboardType: TextInputType.text, text: "First Name"),
                          ),
                          SizedBox(width: AppSize.s30,),
                          Expanded(
                            child: SMTextFConst(controller: lastNameController,
                                isAsteric: false,
                                onChangeField: (value){
                                  updateReferralPatient(context: context,
                                      patientId: providerAddState.patientId,
                                      isUpdatePatiendData: true,firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      contactNo: patientsController.text,
                                      summary: patientsSummary.text,
                                      zipCode: zipCodeController.text,
                                      serviceId: snapshot.data!.fkSrvId,
                                      disciplineIds: desciplineintList,
                                      insuranceId: patientInsuranceId);
                                },
                                keyboardType: TextInputType.text, text: "Last Name"),
                          ),
                          SizedBox(width: AppSize.s30,),
                          Expanded(
                            child: SMTextFConstPhone(controller: patientsController,
                                isAsteric: true,
                                onChanged: (value){
                                  updateReferralPatient(context: context,
                                      patientId: providerAddState.patientId,
                                      isUpdatePatiendData: true,firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      contactNo: patientsController.text,
                                      summary: patientsSummary.text,
                                      zipCode: zipCodeController.text,
                                      serviceId: snapshot.data!.fkSrvId,
                                      disciplineIds: desciplineintList,
                                      insuranceId: patientInsuranceId);
                                },
                                keyboardType: TextInputType.text, text: "Patient or Caregiver Phone Number"),
                          ),
                          SizedBox(width: AppSize.s30,),
                          Expanded(
                            child: SMTextFConst(controller: zipCodeController,
                                isAsteric: false,
                                onChangeField: (value){
                                  updateReferralPatient(context: context,
                                      patientId: providerAddState.patientId,
                                      isUpdatePatiendData: true,firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      contactNo: patientsController.text,
                                      summary: patientsSummary.text,
                                      zipCode: zipCodeController.text,
                                      serviceId: snapshot.data!.fkSrvId,
                                      disciplineIds: desciplineintList,
                                      insuranceId: patientInsuranceId);
                                },
                                keyboardType: TextInputType.text, text: "Zip Code"),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s10,),
                      Row(
                        children: [
                          SizedBox(width: AppSize.s25,),
                          Expanded(
                            child: FutureBuilder<List<ServicePatientReffralsData>>(
                              future: getReferealsServiceList(context: context),
                              builder: (context, snapshotService) {
                                if (snapshotService.connectionState == ConnectionState.waiting) {
                                  return SchedularTextField(
                                    isIconVisible: true,
                                    controller: TextEditingController(text: snapshot.data!.service.srvName),
                                    labelText: 'Referred for',
                                  );
                                }

                                if (snapshotService.hasData) {
                                  List<DropdownMenuItem<String>> dropDownList = [];
                                  for (var i in snapshotService.data!) {
                                    dropDownList.add(DropdownMenuItem<String>(
                                      child: Text(i.serviceName!),
                                      value: i.serviceName,
                                    ));
                                  }
                                  // List<String> statusList = [];
                                  // for (var i in snapshot.data!) {
                                  //   statusList.add(i.patientStatus);
                                  // }

                                  return CustomDropdownTextFieldsm(
                                      isIconVisible: false,
                                      headText: 'Referred for',
                                      initialValue: snapshot.data!.service.srvName,
                                      dropDownMenuList: dropDownList,
                                      onChanged: (newValue) {
                                        for (var a in snapshotService.data!) {
                                          updateReferralPatient(context: context,
                                              patientId: providerAddState.patientId,
                                              isUpdatePatiendData: true,firstName: firstNameController.text,
                                              lastName: lastNameController.text,
                                              contactNo: patientsController.text,
                                              summary: patientsSummary.text,
                                              zipCode: zipCodeController.text,
                                              serviceId: a.serviceId,
                                              disciplineIds: desciplineintList,
                                              insuranceId: patientInsuranceId);
                                        }
                                      });
                                } else {
                                  return const Offstage();
                                }
                              },
                            ),
                          ),
                          SizedBox(width: AppSize.s30,),
                          Expanded(
                            child: SMTextFConst(controller: patientsSummary,
                                isAsteric: false,
                                onChangeField: (value){
                                  updateReferralPatient(context: context,
                                      patientId: providerAddState.patientId,
                                      isUpdatePatiendData: true,firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      contactNo: patientsController.text,
                                      summary: patientsSummary.text,
                                      zipCode: zipCodeController.text,
                                      serviceId: snapshot.data!.fkSrvId,
                                      disciplineIds: desciplineintList,
                                      insuranceId: patientInsuranceId);
                                },
                                keyboardType: TextInputType.text, text: "Patient Summary"),
                          ),
                          SizedBox(width: AppSize.s30,),
                          Expanded(
                            child: Container(
                              height: 30,
                              width: AppSize.s354,
                            ),
                          ),
                          SizedBox(width: AppSize.s30,),
                          Expanded(
                            child: Container(
                              height: 30,
                              width: AppSize.s354,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s50,),
                      ///insurance
                      BlueBGHeadConst(HeadText: "Insurance"),
                      SizedBox(height: AppSize.s20,),
                      StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState){
                        return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                          children: [
                            SizedBox(width: 15),
                            CustomRadioListTile(
                              value: 'Insurance',
                              groupValue: selectedType,
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value!;
                                });
                              },
                              title: 'Insurance',
                            ),
                            SizedBox(width: 110,),
                            CustomRadioListTile(
                              value: 'Self Pay',
                              groupValue: selectedType,
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value!;
                                });
                              },
                              title: 'Self Pay',
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 6),
                          child: Text(
                            'Mark as Primary',
                            style: AllPopupHeadings.customTextStyle(context),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Container(
                        //   color: selectedType == 'Self Pay' ? Colors.grey.shade200 : Colors.transparent,
                        //   child: IgnorePointer(
                        //     ignoring: selectedType == 'Self Pay',
                        //     child: ListView.builder(
                        //       shrinkWrap: true,
                        //       itemCount: 2,
                        //       itemBuilder: (context, index) {
                        //         return Padding(
                        //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        //           child: Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                 'Insurance  #${index + 1}',
                        //                 style: TextStyle(
                        //                   fontSize: FontSize.s14,
                        //                   fontWeight: FontWeight.w500,
                        //                   color: ColorManager.mediumgrey,
                        //                   decoration: TextDecoration.none,
                        //                 ),
                        //               ),
                        //               Row(
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   Expanded(
                        //                     child: Container(
                        //                       padding: EdgeInsets.only(top: 15),
                        //                       child: Checkbox(
                        //                         splashRadius: 0,
                        //                         checkColor: ColorManager.white,
                        //                         activeColor: ColorManager.bluebottom,
                        //                         side: BorderSide(color: ColorManager.bluebottom, width: 2),
                        //                         value: isCheckedList[index],
                        //                         onChanged: (bool? value) {
                        //                           setState(() {
                        //                             isCheckedList[index] = value!;
                        //                           });
                        //                         },
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   SizedBox(width: 20),
                        //                   Expanded(
                        //                     flex: 2,
                        //                     child: SMTextFConst(
                        //                       controller: policy,
                        //                       isAsteric: false,
                        //                       keyboardType: TextInputType.text,
                        //                       text: "Policy #",
                        //                     ),
                        //                   ),
                        //                   Expanded(child: Container()),
                        //                   Expanded(
                        //                     flex: 2,
                        //                     child: SMTextFConst(
                        //                       controller: provider,
                        //                       isAsteric: false,
                        //                       keyboardType: TextInputType.text,
                        //                       text: "Insurance Provider :",
                        //                     ),
                        //                   ),
                        //                   Expanded(child: Container()),
                        //                   Expanded(
                        //                     flex: 2,
                        //                     child: SMTextFConst(
                        //                       controller: plan,
                        //                       isAsteric: false,
                        //                       keyboardType: TextInputType.text,
                        //                       text: "Insurance Plan :",
                        //                     ),
                        //                   ),
                        //                   SizedBox(width: 10),
                        //                   Expanded(
                        //                     flex: 2,
                        //                     child: Column(
                        //                       mainAxisAlignment: MainAxisAlignment.start,
                        //                       children: [
                        //                         Text(
                        //                           "Eligibility:",
                        //                           style: AllPopupHeadings.customTextStyle(context),
                        //                         ),
                        //                         SizedBox(height: 12),
                        //                         Container(
                        //                           height: 30,
                        //                           padding: EdgeInsets.only(left: 45, right: 20),
                        //                           child: Text(
                        //                             "Not all visit\ncovered",
                        //                             style: TextStyle(
                        //                               fontSize: FontSize.s12,
                        //                               fontWeight: FontWeight.w700,
                        //                               color: ColorManager.greenDark,
                        //                             ),
                        //                           ),
                        //                         )
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   SizedBox(width: 20),
                        //                   Container(
                        //                     width: 30,
                        //                     height: 30,
                        //                     decoration: BoxDecoration(
                        //                       color: ColorManager.greenDark,
                        //                       borderRadius: BorderRadius.circular(3),
                        //                     ),
                        //                     child: Center(
                        //                       child: Text(
                        //                         "A",
                        //                         textAlign: TextAlign.center,
                        //                         style: TextStyle(
                        //                           fontSize: FontSize.s12,
                        //                           fontWeight: FontWeight.w700,
                        //                           color: ColorManager.white,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   SizedBox(width: 30),
                        //                   Expanded(
                        //                     flex: 2,
                        //                     child: Column(
                        //                       children: [
                        //                         CustomElevatedButton(
                        //                           width: AppSize.s130,
                        //                           height: AppSize.s30,
                        //                           text: "Check Eligibility",
                        //                           color: ColorManager.bluebottom,
                        //                           onPressed: () {},
                        //                         ),
                        //                         SizedBox(height: 5),
                        //                         Text(
                        //                           "Last checked at 8:30 AM",
                        //                           style: TextStyle(
                        //                             fontSize: FontSize.s12,
                        //                             fontWeight: FontWeight.w400,
                        //                             color: ColorManager.mediumgrey,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //               SizedBox(height: 10),
                        //               Divider(thickness: 1, height: 30),
                        //             ],
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),

                        Opacity(
                          opacity: selectedType == 'Self Pay' ? 0.2 :  0.9,
                          child: Container(
                            child: IgnorePointer(
                              ignoring: selectedType == 'Self Pay',
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: patientInsurance.length, // Adjust as needed
                                itemBuilder: (context, index) {
                                  policy = TextEditingController(text: patientInsurance[index].insurance_policy);
                                  provider = TextEditingController(text: patientInsurance[index].insurance_provider);
                                  plan = TextEditingController(text: patientInsurance[index].insurance_plan);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Insurance  #${index + 1}',
                                          style: TextStyle(
                                            fontSize: FontSize.s14,
                                            fontWeight: FontWeight.w500,
                                            color: ColorManager.mediumgrey,
                                            decoration: TextDecoration.none,
                                          ),
                                          //AllPopupHeadings.customTextStyle(context),
                                        ),
                                        Row(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child:  Container(
                                                padding: EdgeInsets.only(top: 15),
                                                child: Checkbox(
                                                  splashRadius: 0,
                                                  checkColor: ColorManager.white,
                                                  activeColor: ColorManager.bluebottom,
                                                  side: BorderSide(color: ColorManager.bluebottom, width: 2),
                                                  value: patientInsuranceId == patientInsurance[index].insurance_id ? true :isCheckedList[index],
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      isCheckedList[index] = value!;
                                                      updateReferralPatient(context: context,
                                                          patientId: providerAddState.patientId,
                                                          isUpdatePatiendData: true,firstName: firstNameController.text,
                                                          lastName: lastNameController.text,
                                                          contactNo: patientsController.text,
                                                          summary: patientsSummary.text,
                                                          zipCode: zipCodeController.text,
                                                          serviceId: snapshot.data!.fkSrvId,
                                                          disciplineIds: desciplineintList,
                                                          insuranceId: value == true ? patientInsuranceId : patientInsurance[index].insurance_id);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            //SizedBox(width: 20,),
                                            Expanded(
                                              flex: 2,
                                              child: SMTextFConst(
                                                controller: policy,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "Policy #",
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                            Expanded(
                                              flex: 2,
                                              child: SMTextFConst(
                                                controller: provider,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                textColor: ColorManager.blueprime,
                                                text: "Insurance Provider :",
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                            Expanded(
                                              flex: 2,
                                              child: SMTextFConst(
                                                controller: plan,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                textColor: ColorManager.blueprime,
                                                text: "Insurance Plan :",
                                              ),
                                            ),
                                           SizedBox(width: 10,),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                Container(
                                                  child: Text("Eligibility:",
                                                    style: AllPopupHeadings.customTextStyle(context),),
                                                ),
                                                SizedBox(height: 12,),
                                                Container(
                                                  height: 30,
                                                  padding: EdgeInsets.only(left: 45,right: 20),
                                                  child: Text("Not all visit\ncovered",
                                                    style: TextStyle(
                                                      fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w700,
                                                      color: ColorManager.greenDark,
                                                    ),),
                                                )
                                              ],),
                                            ),
                                            //SizedBox(width: 20,),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: ColorManager.greenDark,
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                              child: Center(
                                                child: Text("A",
                                                 textAlign: TextAlign.center,
                                                 style: TextStyle(
                                                   fontSize: FontSize.s12,
                                                   fontWeight: FontWeight.w700,
                                                   color: ColorManager.white,
                                                 ),),
                                              ),
                                            ),
                                            SizedBox(width: 30,),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                children: [
                                                  CustomElevatedButton(
                                                    width: AppSize.s130,
                                                    height: AppSize.s30,
                                                    text: "Check Eligibility",
                                                    color:  ColorManager.bluebottom,
                                                    onPressed: (){},
                                                  ),
                                                  SizedBox(height: 5,),
                                                  Text("Last checked at 8:30 AM",
                                                    style: TextStyle(
                                                      fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w400,
                                                      color: ColorManager.mediumgrey,
                                                    ),),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Divider(
                                        //  color: ColorManager.containerBorderGrey,
                                          thickness: 1,
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                                            ],
                                          );
          }
                      ),
                      SizedBox(height: AppSize.s20,),
                      ///diagnosis
                      BlueBGHeadConst(HeadText: "Diagnosis"),
                      SizedBox(height: AppSize.s10,),
                      Column(
                        children: providerAddState.diagnosisKeys.asMap().entries.map((entry) {
                          int index = entry.key;
                          GlobalKey<_DiagosisListState> key = entry.value;
                          List<PatientDiagnosesModel> data = providerAddState.diagnosisData;

                          return DiagosisList(
                            key: key,
                            index: index + 1,
                            onRemove: () => providerAddState.removeDiagnosis(key),
                            isVisible: providerAddState.isVisible, diagnosisData: data,
                          );
                        }).toList(),
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [ Container(
                      //     height: AppSize.s30,
                      //     child: CustomIconButton(
                      //       color: ColorManager.bluebottom,
                      //       icon: Icons.add,
                      //       textWeight: FontWeight.w700,
                      //       textSize: FontSize.s12,
                      //       text: "Add Diagnosis",
                      //       onPressed: ()async {
                      //           providerAddState.setVisibility(true);
                      //           providerAddState.addDiagnosis();
                      //
                      //       },
                      //     ),
                      //   ),],
                      // ),
                      SizedBox(height: AppSize.s40,),
                      ///Suggested Plan of Care
                      BlueBGHeadConst(HeadText: "Disciplines Ordered"),
                      SizedBox(height: AppSize.s10,),
                       StatefulBuilder(
                           builder: (BuildContext context, StateSetter setState){
                      return Container(height: 150,
                                  child: StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setState){
                                    return Row(
                                            children: [
                                              Expanded(
                                                flex:3,
                                                child:
                                                // FutureBuilder<List<EmployeeClinicalData>>(
                                                //   future: getEmployeeClinicalInReffreals(context: context),
                                                //   builder: (context, snapshotEmp) {
                                                //     if (snapshotEmp.connectionState == ConnectionState.waiting) {
                                                //       return Center(
                                                //         child: CircularProgressIndicator(color: ColorManager.blueprime),
                                                //       );
                                                //     }
                                                //     if (snapshotEmp.hasData) {
                                                //       return
                                                        Padding(
                                                        padding: const EdgeInsets.only(left: 25),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "Disciplines",
                                                                  style: TextStyle(
                                                                    fontSize: FontSize.s14,
                                                                    fontWeight: FontWeight.w700,
                                                                    color: ColorManager.mediumgrey,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 30),
                                                                InkWell(
                                                                  hoverColor: Colors.transparent,
                                                                  splashColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () {},
                                                                  child: SvgPicture.asset(
                                                                    'images/sm/sm_refferal/i_circle.svg',
                                                                    height: IconSize.I20,
                                                                    width: IconSize.I20,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 10),
                                                            Wrap(
                                                                spacing: 10,
                                                                runSpacing: 10,
                                                                children: [
                                                                  ...List.generate(employeeClinicalData.length, (index){
                                                                    bool isCheckedValue = desciplineModel.contains(employeeClinicalData[index].empType);
                                                                    return buildCheckbox(
                                                                      employeeClinicalData[index].empType,
                                                                      isCheckedValue,
                                                                          (value) {
                                                                        setState(() {
                                                                          // isCheckedValue = value!;
                                                                          if (value!) {
                                                                            desciplineModel.add(employeeClinicalData[index].empType);
                                                                            desciplineintList.add(employeeClinicalData[index].emptypeId);
                                                                            desciplineModelAbbrivation.add(employeeClinicalData[index].abbreviation);
                                                                            desciplineModelAbbrivationColor.add(employeeClinicalData[index].color);
                                                                            updateReferralPatient(context: context,
                                                                                patientId: providerAddState.patientId,
                                                                                isUpdatePatiendData: true,firstName: firstNameController.text,
                                                                                lastName: lastNameController.text,
                                                                                contactNo: patientsController.text,
                                                                                summary: patientsSummary.text,
                                                                                zipCode: zipCodeController.text,
                                                                                serviceId: snapshot.data!.fkSrvId,
                                                                                disciplineIds: desciplineintList,
                                                                                insuranceId: patientInsuranceId);
                                                                          } else {
                                                                            desciplineModel.remove(employeeClinicalData[index].empType);
                                                                            desciplineintList.remove(employeeClinicalData[index].emptypeId);
                                                                            desciplineModelAbbrivation.remove(employeeClinicalData[index].abbreviation);
                                                                            desciplineModelAbbrivationColor.remove(employeeClinicalData[index].color);
                                                                            updateReferralPatient(context: context,
                                                                                patientId: providerAddState.patientId,
                                                                                isUpdatePatiendData: true,firstName: firstNameController.text,
                                                                                lastName: lastNameController.text,
                                                                                contactNo: patientsController.text,
                                                                                summary: patientsSummary.text,
                                                                                zipCode: zipCodeController.text,
                                                                                serviceId: snapshot.data!.fkSrvId,
                                                                                disciplineIds: desciplineintList,
                                                                                insuranceId: patientInsuranceId);
                                                                          }
                                                                        });
                                                                      },
                                                                      desciplineModel,
                                                                    );
                                                                  })
                                                                ]
                                                                // snapshotEmp.data!.map((empData) {
                                                                //
                                                                //   return
                                                                // }).toList(),
                                                              )
                                                          ],
                                                        ),
                                                      ),
                                                //     } else {
                                                //       return SizedBox();
                                                //     }
                                                //   },
                                                // )

                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 20.0),
                                                      child: Text(
                                                        "Distance from Patient’s Home",
                                                        style:  CustomTextStylesCommon.commonStyle(
                                                            color: ColorManager.mediumgrey,
                                                            fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w700),
                                                      ),
                                                    ),
                                                    StatefulBuilder(
                                                        builder: (BuildContext context, StateSetter setState){
                                                      return Container(
                                                        width: 600,
                                                        child: SliderTheme(
                                                          data: SliderThemeData(
                                                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                                                          ),
                                                          child: Slider(
                                                            value: _sliderValue,
                                                            min: 0,
                                                            max: 200,
                                                            divisions: 4,
                                                            // label: _sliderValue.round().toString(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _sliderValue = value;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                               }
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: List.generate(5, (index) => Text("${index * 50}")),
                                                      ),
                                                    ),
                                                    SizedBox(height: 16),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 20.0),
                                                      child: Text(
                                                        "Available Clinicians",
                                                        style: CustomTextStylesCommon.commonStyle(
                                                            color: ColorManager.mediumgrey,
                                                            fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w700),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 20.0),
                                                      child: Row(
                                                        spacing: 20,
                                                        children: [
                                                          ...List.generate(desciplineModelAbbrivation.length, (index){
                                                            var hexColor = desciplineModelAbbrivationColor[index].replaceAll("#", "");
                                                            return  Row(
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  child: Chip(
                                                                    label: Padding(
                                                                      padding: const EdgeInsets.only(bottom: 5.0),
                                                                      child: Text(desciplineModelAbbrivation[index],
                                                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 11)),
                                                                    ),
                                                                    backgroundColor:Color(int.parse('0xFF$hexColor')),
                                                                  ),
                                                                ),
                                                                SizedBox(width: 4),
                                                                Text("112", style: TextStyle(fontWeight: FontWeight.bold)),
                                                                // SizedBox(width: 50),
                                                                // Container(
                                                                //   height: 20,
                                                                //   child: Chip(
                                                                //     label: Padding(
                                                                //       padding: const EdgeInsets.only(bottom: 5.0),
                                                                //       child: Text("OT", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 11)),
                                                                //     ),
                                                                //     backgroundColor: Colors.orangeAccent,
                                                                //   ),
                                                                // ),
                                                                // SizedBox(width: 4),
                                                                // Text("02", style: TextStyle(fontWeight: FontWeight.bold)),
                                                              ],
                                                            );
                                                          })
                                                        ],
                                                      )
                                                    ),
                                                  ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );}
                                  )
                                  );
          }
                       ),

                      SizedBox(height: AppSize.s30,),
                      ///documents
                      BlueBGHeadConst(HeadText: "Documents"),
                      SizedBox(height: AppSize.s30,),
                      Text(
                        'Upload Bulk Document',
                        style:TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.mediumgrey,
                        ),
                      ),
                      SizedBox(height: 8),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState){
                        return DottedBorder(
                          color: Color(0xFFDBDBDB),
                          strokeWidth: 1,
                          dashPattern: [6, 3],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                         // borderPadding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            alignment: Alignment.center,
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: ()async{
                                FilePickerResult? result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['svg', 'png', 'jpg', 'gif'],
                                );

                                if (result != null) {
                                  setState(() {
                                    selectedFileName = result.files.single.name;
                                  });
                                  ApiData apiData =  await postReferralPatientDocuments(
                                      context: context,
                                      fk_pt_id: providerAddState.patientId,
                                      rptd_url: result.files.first.name,
                                      rptd_created_by: snapshot.data!.marketer.employeeId);
                                  if(apiData.statusCode == 200 || apiData.statusCode == 201){
                                    var uploadPatientDoc = await uploadPatientReffrelsDocuments(context: context,
                                        rptd_id: apiData.rptd_id!,
                                        documentFile: result.files.first.bytes,
                                        documentName: result.files.first.name);
                                    if(uploadPatientDoc.success == true){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddSuccessPopup(
                                            message: 'Document Uploaded Successfully',
                                          );
                                        },
                                      );
                                    }
                                  }

                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                        color: Color(0xFFE6F1FE)
                                 ),
                                  child: Center(child: SvgPicture.asset('images/doc_vector.svg',height: 30,width: 30,))),
                                  SizedBox(width: 30),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "Drop your files here or ",
                                          style: TextStyle(color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text: "Click to upload",
                                              style: TextStyle(color: ColorManager.blueBorder, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text("SVG, PNG, JPG or GIF (max. 800x400px)",
                                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );},
                      ),
                      if (selectedFileName != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Selected file: $selectedFileName",
                              style: TextStyle(color: Colors.green)),
                        ),
                      StreamBuilder<List<PatientDocumentsData>>(
                        stream: _streamController.stream,
                        builder: (context,snapshotDoc) {
                          getReffrealsPatientDocuments(context: context, patientId: providerAddState.patientId,).then((data) {
                            _streamController.add(data);
                          }).catchError((error) {
                            // Handle error
                          });
                          if(snapshotDoc.connectionState == ConnectionState.waiting){
                            return Center(
                              child: SizedBox(
                                height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(color: ColorManager.blueprime,)),
                            );
                          }
                          if(snapshotDoc.data!.isEmpty){
                            return Center(
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(vertical: 76),
                                  child: Text(
                                    AppStringSMModule.patientDocNoData,
                                    style: AllNoDataAvailable.customTextStyle(context),
                                  ),
                                ));
                          }
                          if(snapshotDoc.hasData){
                            return Column(
                              children: [
                                Container(
                                  height: 200,
                                  child: ScrollConfiguration(
                                    behavior: ScrollBehavior().copyWith(scrollbars: false),
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: snapshotDoc.data!.length,//paginatedData.length,
                                        itemBuilder: (context, index) {
                                          //  int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
                                          // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
                                          var fileUrl = snapshotDoc.data![index].rptd_url;//policiesdata.docurl;
                                          final fileExtension = fileUrl.split('/').last;

                                          Widget fileWidget;
                                          if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
                                            fileWidget = Image.network(
                                              fileUrl,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Icon(
                                                  Icons.broken_image,
                                                  size: IconSize.I45,
                                                  color: ColorManager.faintGrey,
                                                );
                                              },
                                            );
                                          }
                                          else if (['pdf', 'doc', 'docx'].contains(fileExtension)) {
                                            fileWidget = Icon(
                                              Icons.description,
                                              size: IconSize.I45,
                                              color: ColorManager.faintGrey,
                                            );
                                          }
                                          else {
                                            fileWidget = Icon(
                                              Icons.insert_drive_file,
                                              size: IconSize.I45,
                                              color: ColorManager.faintGrey,
                                            );
                                          }
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              //SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: AppPadding.p8,),
                                                child: Container(
                                                    margin: EdgeInsets.symmetric(horizontal: AppSize.s5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(4),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: const Color(0xff000000).withOpacity(0.25),
                                                          spreadRadius: 0,
                                                          blurRadius: 4,
                                                          offset: const Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    height: AppSize.s65,
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: (){
                                                                  print("FileExtension:${fileExtension}");
                                                                  downloadFile(fileUrl);
                                                                  //DowloadFile();
                                                                  //.downloadPdfFromBase64(fileExtension,"Acknowledgement");
                                                                },
                                                                child: Container(
                                                                    width: AppSize.s62,
                                                                    height: AppSize.s45,
                                                                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p8),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(4),
                                                                      border: Border.all(width: 2, color: ColorManager.faintGrey),
                                                                    ),
                                                                    child: SvgPicture.asset('images/doc_vector.svg')),
                                                              ),
                                                              SizedBox(width: AppSize.s10,),
                                                              Text(
                                                                snapshotDoc.data![index].documentName,
                                                                //policiesdata.fileName.toString(),
                                                                textAlign: TextAlign.center,
                                                                style:  DocDefineTableData.customTextStyle(context),
                                                              ),
                                                            ],
                                                          ),

                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              // IconButton(
                                                              //   onPressed: () {},
                                                              //   // {
                                                              //   //   showDialog(
                                                              //   //     context: context,
                                                              //   //     builder: (context) =>
                                                              //   //         ManageHistoryPopup(
                                                              //   //           docHistory: 'new',//policiesdata.docHistory,
                                                              //   //         ),
                                                              //   //   );
                                                              //   // },
                                                              //   icon: Icon(
                                                              //     Icons.history,
                                                              //     size:IconSize.I22,color: IconColorManager.bluebottom,
                                                              //   ),
                                                              //   splashColor: Colors.transparent,
                                                              //   highlightColor: Colors.transparent,
                                                              //   hoverColor: Colors.transparent,
                                                              // ),
                                                              // SizedBox(width: AppSize.s10,),
                                                              ///print
                                                              IconButton(
                                                                onPressed: () {
                                                                  print("FileExtension:${fileExtension}");
                                                                  // DowloadFile()
                                                                  //     .downloadPdfFromBase64(
                                                                  //     fileExtension,
                                                                  //     "DME.pdf");
                                                                  downloadFile(fileUrl);
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .print_outlined,
                                                                  size:IconSize.I22,color: IconColorManager.bluebottom,
                                                                ),
                                                                splashColor:
                                                                Colors.transparent,
                                                                highlightColor:
                                                                Colors.transparent,
                                                                hoverColor:
                                                                Colors.transparent,
                                                              ),
                                                              SizedBox(width: AppSize.s10,),
                                                              ///download saloni
                                                              PdfDownloadButton(apiUrl: snapshotDoc.data![index].rptd_url,// policiesdata.docurl,
                                                                iconsize: IconSize.I22,
                                                                documentName: snapshotDoc.data![index].documentName,//policiesdata.docName!
                                                              ),
                                                              // SizedBox(width: AppSize.s10,),
                                                              // ///edit
                                                              // IconButton(
                                                              //   onPressed: (){},
                                                              //   //     () {
                                                              //   //   showDialog(
                                                              //   //     context: context,
                                                              //   //     builder: (context) {
                                                              //   //       return FutureBuilder<
                                                              //   //           MCorporateCompliancePreFillModal>(
                                                              //   //         future: getPrefillNewOrgOfficeDocument(
                                                              //   //             context,
                                                              //   //             policiesdata
                                                              //   //                 .orgOfficeDocumentId),
                                                              //   //         builder: (context,
                                                              //   //             snapshotPrefill) {
                                                              //   //           if (snapshotPrefill
                                                              //   //               .connectionState ==
                                                              //   //               ConnectionState
                                                              //   //                   .waiting) {
                                                              //   //             return Center(
                                                              //   //               child:
                                                              //   //               CircularProgressIndicator(
                                                              //   //                 color: ColorManager
                                                              //   //                     .blueprime,
                                                              //   //               ),
                                                              //   //             );
                                                              //   //           }
                                                              //   //
                                                              //   //           var calender =
                                                              //   //               snapshotPrefill
                                                              //   //                   .data!
                                                              //   //                   .expiry_date;
                                                              //   //           calenderController =
                                                              //   //               TextEditingController(
                                                              //   //                 text: snapshotPrefill
                                                              //   //                     .data!
                                                              //   //                     .expiry_date,
                                                              //   //               );
                                                              //   //           return StatefulBuilder(
                                                              //   //             builder: (BuildContext
                                                              //   //             context,
                                                              //   //                 void Function(void Function())
                                                              //   //                 setState) {
                                                              //   //               return VCScreenPopupEditConst(
                                                              //   //                 fileName: snapshotPrefill
                                                              //   //                     .data!
                                                              //   //                     .fileName,
                                                              //   //                 url: snapshotPrefill.data!.url,
                                                              //   //                 expiryDate: snapshotPrefill.data!.expiry_date,
                                                              //   //                 title: EditPopupString.editPolicy,
                                                              //   //                 loadingDuration: _isLoading,
                                                              //   //                 officeId: widget.officeId,
                                                              //   //                 docTypeMetaIdCC: widget.docID,
                                                              //   //                 selectedSubDocId: widget.subDocID,
                                                              //   //                 //orgDocId: manageCCADR.orgOfficeDocumentId,
                                                              //   //                 orgDocId: snapshotPrefill.data!.orgOfficeDocumentId,
                                                              //   //                 orgDocumentSetupid: snapshotPrefill.data!.documentSetupId,
                                                              //   //                 docName: snapshotPrefill.data!.docName,
                                                              //   //                 selectedExpiryType: snapshotPrefill.data!.expType,
                                                              //   //                 documentType: AppStringEM.policiesAndProcedures,
                                                              //   //                 documentSubType: '',
                                                              //   //                 isOthersDocs: snapshotPrefill.data!.isOthersDocs,
                                                              //   //                 idOfDoc: snapshotPrefill.data!.idOfDocument,
                                                              //   //                 expiryType: snapshotPrefill.data!.expType,
                                                              //   //                 threshhold: snapshotPrefill.data!.threshould,
                                                              //   //               );
                                                              //   //             },
                                                              //   //           );
                                                              //   //         },
                                                              //   //       );
                                                              //   //     },
                                                              //   //   );
                                                              //   // },
                                                              //   icon: Icon(
                                                              //     Icons.edit_outlined,
                                                              //     size:IconSize.I22,color: IconColorManager.bluebottom,
                                                              //   ),
                                                              //   splashColor:
                                                              //   Colors.transparent,
                                                              //   highlightColor:
                                                              //   Colors.transparent,
                                                              //   hoverColor:
                                                              //   Colors.transparent,
                                                              // ),
                                                              SizedBox(width: AppSize.s10,),
                                                              ///delete
                                                              IconButton(
                                                                  splashColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  onPressed: () async{
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (context) =>
                                                                            StatefulBuilder(
                                                                              builder: (BuildContext context, void Function(void Function())setState) {
                                                                                return DeletePopup(
                                                                                  loadingDuration: _isLoading,
                                                                                  title: 'Delete Document',
                                                                                  onCancel: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  onDelete: () async {
                                                                                    setState(() {
                                                                                      _isLoading = true;
                                                                                    });
                                                                                    try {
                                                                                      var response =  await deletePatientDocument(context: context, docId: snapshotDoc.data![index].rptd_id, );
                                                                                      if(response.statusCode == 200  || response.statusCode == 201) {
                                                                                        Navigator.pop(context);
                                                                                        // Future.delayed(Duration(seconds: 1));
                                                                                        showDialog(
                                                                                          context: context,
                                                                                          builder: (BuildContext context) => DeleteSuccessPopup(),
                                                                                        );
                                                                                      }
                                                                                    } finally {
                                                                                      setState(() {
                                                                                        _isLoading = false;
                                                                                        //Navigator.pop(context);
                                                                                      });
                                                                                    }
                                                                                    // setState(() async{
                                                                                    //
                                                                                    //   Navigator.pop(context);
                                                                                    // });
                                                                                  },
                                                                                );
                                                                              },
                                                                            ));
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete_outline,
                                                                    size:IconSize.I24,color: IconColorManager.red,
                                                                  )),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            );
                          }else{
                            return SizedBox();
                          }

                        }
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }
  Widget buildCheckbox(String title, bool value, Function(bool?) onChanged, List<String> prefillData) {
    return Container(
      width: 170,
      child: Row(
        children: [
          Checkbox(
            splashRadius: 0,
            hoverColor: Colors.transparent,
            value: value,
            activeColor: ColorManager.bluebottom,
            onChanged: onChanged,
          ),
          Text(title, style:  CustomTextStylesCommon.commonStyle(
              color: ColorManager.mediumgrey,
              fontSize: FontSize.s12,
              fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}




class DiagosisList extends StatefulWidget {
  // final int employeeID;
  final VoidCallback onRemove;
  final int index;
  final bool isVisible;
  final List<PatientDiagnosesModel> diagnosisData;
  const DiagosisList(
      {Key? key,
        required this.onRemove,
        required this.index,
        // required this.employeeID,
        required this.isVisible, required this.diagnosisData, })
      : super(key: key);
  @override
  _DiagosisListState createState() => _DiagosisListState();
}

class _DiagosisListState extends State<DiagosisList> {

  // TextEditingController possible = TextEditingController();
  // TextEditingController icd = TextEditingController();
  // TextEditingController pdgm = TextEditingController();
  final List<TextEditingController> _possibleControllers = [];
  final List<TextEditingController> _icdControllers = [];
  final List<TextEditingController> _pdgmControllers = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.diagnosisData.length; i++) {
      _possibleControllers.add(TextEditingController(text: widget.diagnosisData[i].dgnName));
      _icdControllers.add(TextEditingController(text: widget.diagnosisData[i].dgnCode.toString()));
      _pdgmControllers.add(TextEditingController(text: widget.diagnosisData[i].rpt_pdgm ? 'YES':'NO'));
    }

    // If new empty row is added (no model data), add blank controllers
    if (widget.diagnosisData.length < widget.index) {
      _possibleControllers.add(TextEditingController());
      _icdControllers.add(TextEditingController());
      _pdgmControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child:  ListView.builder(
            shrinkWrap: true,
            itemCount: widget.diagnosisData.length, // Adjust as needed
            itemBuilder: (context, index) {
              // possible = TextEditingController(text: widget.diagnosisData[index].dgnName);
              // icd = TextEditingController(text: widget.diagnosisData[index].dgnId.toString());
              // pdgm = TextEditingController(text: widget.diagnosisData[index].dgnCode);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(height: 90,width: 5,color: widget.diagnosisData[index].color == 0 ?ColorManager.red: ColorManager.greenDark),
                        SizedBox(width: AppSize.s30,),
                        Expanded(
                          child: SMTextFConst(controller: _possibleControllers[index],
                              isAsteric: false,
                              isIcon: true,
                              keyboardType: TextInputType.text, text: "Possible Diagnosis"),
                        ),
                        SizedBox(width: AppSize.s60,),
                        Expanded(
                          child: SMTextFConst(controller: _icdControllers[index],
                              isAsteric: false,
                              isIcon: true,
                              keyboardType: TextInputType.text, text: "ICD Code"),
                        ),
                        SizedBox(width: AppSize.s60,),
                        Expanded(
                          child: SMTextFConst(controller: _pdgmControllers[index],
                              isAsteric: false,
                              isIcon: true,
                              textColor:widget.diagnosisData[index].rpt_pdgm ? Color(0xFF008000) : Color(0xFFD20101),
                              keyboardType: TextInputType.text, text: "PDGM - Acceptable"),
                        ),
                        SizedBox(width: AppSize.s30,),
                        Expanded(
                          child: Container(
                            height: 30,
                            width: AppSize.s354,
                          ),
                        ),
                        SizedBox(width: AppSize.s30,),
                        Expanded(
                          child: Container(
                            height: 30,
                            width: AppSize.s354,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorManager.containerBorderGrey,
                      thickness: 1,
                      height: 2,
                    ),
                    SizedBox(height: AppSize.s30,),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
