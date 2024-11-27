import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prohealth/app/constants/app_config.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/ci_org_doc_manager.dart';
import 'package:prohealth/data/api_data/establishment_data/company_identity/ci_org_document.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/vendor_contract/leasas_services.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/vendor_contract/snf.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/services/api/managers/establishment_manager/newpopup_manager.dart';
import '../../../../../../../data/api_data/establishment_data/ci_manage_button/newpopup_data.dart';
import '../../../../../../widgets/app_clickable_widget.dart';
import '../../../company_identity_screen.dart';
import '../../error_pop_up.dart';
import '../../upload_add_popup.dart';
import '../dme.dart';
import '../md.dart';
import '../misc.dart';

class CiCcVendorContractScreen extends StatefulWidget {
  final int docId;
  final int companyID;
  final String officeId;
  const CiCcVendorContractScreen(
      {super.key,
      required this.companyID,
      required this.officeId,
      required this.docId});

  @override
  State<CiCcVendorContractScreen> createState() =>
      _CiCcVendorContractScreenState();
}

class _CiCcVendorContractScreenState extends State<CiCcVendorContractScreen> {
  final PageController _tabPageController = PageController();
  TextEditingController docNamecontroller = TextEditingController();
  TextEditingController docIdController = TextEditingController();
  TextEditingController nameOfDocController = TextEditingController();
  TextEditingController idOfDocController = TextEditingController();
  TextEditingController editnameOfDocController = TextEditingController();
  TextEditingController editidOfDocController = TextEditingController();
  TextEditingController calenderController = TextEditingController();
  final StreamController<List<IdentityDocumentIdData>> _identityDataController =
      StreamController<List<IdentityDocumentIdData>>.broadcast();

  int _selectedIndex = 0;
  // int docTypeMetaId = 8;
  int docSubTypeMetaId = 0;
  int docTypeMetaIdVC = AppConfig.vendorContracts;
  String? expiryType;
  bool _isLoading = false;
  String? selectedDocTypeValue;
  String? selectedSubDocTypeValue;
  String selectedSubDocType = "";
  int selectedSubDocIdVC = AppConfig.subDocId6Leases;
  dynamic filePath;
  late Future<List<DocumentTypeData>> docTypeFuture;
  TextEditingController expiryDateController = TextEditingController();
  int selectedSubDocId = AppConfig.subDocId6Leases;
  bool showExpiryDateField = false;
  int docTypeId = 0;

  @override
  void initState() {
    super.initState();
    selectedDocTypeValue = "Select Document Type";
    selectedSubDocTypeValue = "Select Sub Document";
    docTypeFuture = documentTypeGet(context);
    _updateSelectedSubDocIdVC(selectedSubDocId);
    showExpiryDateField;
  }

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;

      _updateSelectedSubDocIdVC(index == 0
          ? AppConfig.subDocId6Leases
          : index == 1
              ? AppConfig.subDocId7SNF
              : index == 2
                  ? AppConfig.subDocId8DME
                  : index == 3
                      ? AppConfig.subDocId9MD
                      : AppConfig.subDocId10MISC);
    });
    _tabPageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  String fileName = '';
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        filePath = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  void _updateSelectedSubDocIdVC(int subDocIdVC) {
    setState(() {
      selectedSubDocId = subDocIdVC;
      selectedSubDocType = getSubDocTypeTextVC(subDocIdVC);
    });
  }

  String getSubDocTypeTextVC(int subDocIdVC) {
    switch (subDocIdVC) {
      case AppConfig.subDocId6Leases:
        return "Leases & Services";
      case AppConfig.subDocId7SNF:
        return "SNF";
      case AppConfig.subDocId8DME:
        return "DME";
      case AppConfig.subDocId9MD:
        return "MD";
      case AppConfig.subDocId10MISC:
        return "MISC";
      default:
        return "Unknown Document Type";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             Expanded(
                 flex: 2,
                 child: Container()),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EMTabbar(onTap: (int index){
                        _selectButton(0);
                      }, index: 0, grpIndex: _selectedIndex, heading: AppStringEM.leases),
                      EMTabbar(onTap: (int index){
                        _selectButton(1);
                      }, index: 1, grpIndex: _selectedIndex, heading: AppStringEM.snf),
                      EMTabbar(onTap: (int index){
                        _selectButton(2);
                      }, index: 2, grpIndex: _selectedIndex, heading: AppStringEM.dme),
                      EMTabbar(onTap: (int index){
                        _selectButton(3);
                      }, index: 3, grpIndex: _selectedIndex, heading: AppStringEM.md),
                      EMTabbar(onTap: (int index){
                        _selectButton(4);
                      }, index: 4, grpIndex: _selectedIndex, heading: AppStringEM.misc),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container()),
              CustomIconButton(
                  icon: CupertinoIcons.plus,
                  text: "Add Document",
                  onPressed: () async {
                    String? selectedExpiryType = expiryType;
                    calenderController.clear();
                    docIdController.clear();
                    docNamecontroller.clear();
                    selectedExpiryType = "";
                    int? selectedDocTypeId;
                    showDialog(
                        context: context,
                        builder: (context) {
                          return FutureBuilder<List<TypeofDocpopup>>(
                              future: getTypeofDoc(
                                  context, docTypeMetaIdVC, selectedSubDocId),
                              builder: (contex, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                if (snapshot.hasData) {
                                  return UploadDocumentAddPopup(
                                    loadingDuration: _isLoading,
                                    title: 'Upload Document',
                                    officeId: widget.officeId,
                                    docTypeMetaIdCC: docTypeMetaIdVC,
                                    selectedSubDocId: selectedSubDocId,
                                    dataList: snapshot.data!,
                                    docTypeText:AppStringEM.vendorContracts,
                                    subDocTypeText: getSubDocTypeTextVC(selectedSubDocId),
                                  );
                                } else {
                                  return ErrorPopUp(
                                      title: "Received Error",
                                      text: snapshot.error.toString());
                                }
                              });
                        });
                  }),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 60),
            child: NonScrollablePageView(
              controller: _tabPageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                // Page 1
                CiLeasesAndServices(
                  companyID: widget.companyID,
                  officeId: widget.officeId,
                  docId: widget.docId,
                  subDocId: AppConfig.subDocId6Leases,
                ),
                CiSnf(
                  companyID: widget.companyID,
                  officeId: widget.officeId,
                  docId: widget.docId,
                  subDocId: AppConfig.subDocId7SNF,
                ),
                CiDme(
                  companyID: widget.companyID,
                  officeId: widget.officeId,
                  docId: widget.docId,
                  subDocId: AppConfig.subDocId8DME,
                ),
                CiMd(
                  companyID: widget.companyID,
                  officeId: widget.officeId,
                  docId: widget.docId,
                  subDocId: AppConfig.subDocId9MD,
                ),
                CiMisc(
                  companyID: widget.companyID,
                  officeId: widget.officeId,
                  docId: widget.docId,
                  subDocId: AppConfig.subDocId10MISC,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

///
///
///
typedef void OnManuButtonTapCallBack(int index);

class EMTabbar extends StatelessWidget {
  const EMTabbar({
    super.key,
    required this.onTap,
    required this.index,
    required this.grpIndex,
    required this.heading,
  });

  final OnManuButtonTapCallBack onTap;
  final int index;
  final int grpIndex;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return AppClickableWidget(
      onTap: () {
        onTap(index);
      },
      onHover: (bool val) {},
      child: Column(
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: FontSize.s14,
              fontWeight: grpIndex == index
                  ? FontWeight.w700
                  : FontWeight.w500,
              color: grpIndex == index
                  ? ColorManager.blueprime
                  : ColorManager.mediumgrey,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final textPainter = TextPainter(
                text: TextSpan(
                  text: heading,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textDirection: TextDirection.ltr,
              )..layout();

              final textWidth = textPainter.size.width;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: 2,
                width: textWidth + 20, // Adjust padding around text
                color: grpIndex == index
                    ? ColorManager.blueprime
                    : Colors.transparent,
              );
            },
          ),
        ],
      ),
    );
  }
}


