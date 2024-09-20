import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/data/api_data/establishment_data/company_identity/new_org_doc.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_tab_widget/widget/ci_org_doc_tab/widgets/heading_constant_widget.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import '../../../../../../../../../../app/constants/app_config.dart';
import '../../../../../../../../../../app/resources/color.dart';
import '../../../../../../../../../../app/resources/const_string.dart';
import '../../../../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../../../../../app/services/api/managers/establishment_manager/new_org_doc/new_org_doc.dart';
import '../../../../../../../../../../data/api_data/establishment_data/company_identity/ci_org_document.dart';
import '../../../../../../../../../widgets/widgets/profile_bar/widget/pagination_widget.dart';
import '../../../files_constant-widget.dart';
import '../org_add_popup_const.dart';

class VendorContractMedicalCostReport extends StatefulWidget {
  final int docId;
  final int subDocId;
  const VendorContractMedicalCostReport({super.key, required this.docId,
    required this.subDocId,
  });

  @override
  State<VendorContractMedicalCostReport> createState() => _VendorContractMedicalCostReportState();
}

class _VendorContractMedicalCostReportState extends State<VendorContractMedicalCostReport> {
  TextEditingController docNameController = TextEditingController();
  TextEditingController docIdController = TextEditingController();
  TextEditingController calenderController = TextEditingController();
  TextEditingController idOfDocController = TextEditingController();
  TextEditingController daysController = TextEditingController(text: "1");
  int docTypeMetaIdVC = AppConfig.vendorContracts;
  int docTypeMetaIdVCdme = AppConfig.subDocId8DME;
  final StreamController<List<NewOrgDocument>> _controller = StreamController<List<NewOrgDocument>>();
  final StreamController<List<IdentityDocumentIdData>> _identityDataController = StreamController<List<IdentityDocumentIdData>>.broadcast();
  //int docTypeMetaId =0;
  int docSubTypeMetaId =0;
  String? expiryType;
  bool _isLoading = false;

  String? selectedValue;
  String? selectedYear = AppConfig.year;
  @override
  void initState() {
    super.initState();
    }
  int currentPage = 1;
  final int itemsPerPage = 10;
  final int totalPages = 5;

  void onPageNumberPressed(int pageNumber) {
    setState(() {
      currentPage = pageNumber;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHeadingConst(),
        SizedBox(height: AppSize.s10,),
        PoliciesProcedureList(
          controller: _controller,
          fetchDocuments: (context) => getNewOrgDocfetch(
            context,
            AppConfig.vendorContracts, AppConfig.subDocId8DME, 1, 50,
          ),
          emptyMessage: ErrorMessageString.noDME,
          onEdit: (NewOrgDocument doc) {
            String? selectedExpiryType = expiryType;
            showDialog(context: context, builder: (context){
              return  FutureBuilder<NewOrgDocument>(
                  future: getPrefillNewOrgDocument(context,doc.orgDocumentSetupid),
                  builder: (context,snapshotPrefill) {
                    if(snapshotPrefill.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(color: ColorManager.blueprime,),
                      );
                    }

                    var name = snapshotPrefill.data!.docName;
                    docNameController = TextEditingController(text: snapshotPrefill.data!.docName);

                    var expiry = snapshotPrefill.data!.expiryType;
                    String? selectedExpiryType = expiry;

                    return StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) setState) {
                        return OrgDocNewEditPopup(
                          title: EditPopupString.editDME,
                          orgDocumentSetupid: snapshotPrefill.data!.orgDocumentSetupid,
                          docTypeId: snapshotPrefill.data!.documentTypeId,
                          subDocTypeId: snapshotPrefill.data!.documentSubTypeId,
                          idOfDoc: snapshotPrefill.data!.idOfDocument,
                          docName: snapshotPrefill.data!.docName,
                          expiryType: snapshotPrefill.data!.expiryType,
                          threshhold: snapshotPrefill.data!.threshold,
                          expiryDate: snapshotPrefill.data!.expiryDate,
                          expiryReminder: snapshotPrefill.data!.expiryReminder,
                          docTypeText: AppString.vendorContracts,
                          subDocTypeText: AppStringEM.dme,
                        );
                      },
                    );
                  }
              );
            });
          },
          onDelete: (NewOrgDocument doc) {
            showDialog(context: context,
                builder: (context) => StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) setState) {
                    return  DeletePopup(
                        title: DeletePopupString.deleteDME,
                        loadingDuration: _isLoading,
                        onCancel: (){
                          Navigator.pop(context);
                        }, onDelete: () async{
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        await deleteNewOrgDoc(
                            context, doc.orgDocumentSetupid);
                        getNewOrgDocfetch(context,AppConfig.vendorContracts,AppConfig.subDocId8DME,1,50).then((data) {
                          _controller.add(data);
                        }).catchError((error) {
                          // Handle error
                        });
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.pop(context);
                      }

                    });
                  },

                ));
          },
        ),
      ],
    );
  }
}
///old streambuilder code
// Expanded(
// child:StreamBuilder<List<NewOrgDocument>>(
// stream: _controller.stream,
// builder: (context, snapshot) {
// getNewOrgDocfetch(context,AppConfig.vendorContracts,AppConfig.subDocId8DME,1,50).then((data) {
// _controller.add(data);
// }).catchError((error) {
// // Handle error
// });
// print('1111111');
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Center(
// child: CircularProgressIndicator(
// color: ColorManager.blueprime,
// ),
// );
// }
// if (snapshot.data!.isEmpty) {
// return Center(
// child: Text(
// ErrorMessageString.noDME,
// // AppString.dataNotFound,
// style:  DocumentTypeDataStyle.customTextStyle(context),
// ),
// );
// }
// if (snapshot.hasData) {
// int totalItems = snapshot.data!.length;
// int totalPages = (totalItems / itemsPerPage).ceil();
// List<NewOrgDocument> paginatedData = snapshot.data!.skip((currentPage - 1) * itemsPerPage).take(itemsPerPage).toList();
// return Column(
// children: [
// Expanded(
// child: ListView.builder(
// scrollDirection: Axis.vertical,
// itemCount: paginatedData.length,
// itemBuilder: (context, index) {
// int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
// String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
// NewOrgDocument MCRdata = paginatedData[index];
// return Column(
// children: [
// SizedBox(height: AppSize.s5),
// Container(
// padding: EdgeInsets.only(bottom: AppPadding.p5),
// margin: EdgeInsets.symmetric(horizontal: AppMargin.m50),
// decoration: BoxDecoration(
// color:ColorManager.white,
// borderRadius: BorderRadius.circular(4),
// boxShadow: [
// BoxShadow(
// color: ColorManager.grey.withOpacity(0.5),
// spreadRadius: 1,
// blurRadius: 4,
// offset: Offset(0, 2),
// ),
// ],
// ),
// height: AppSize.s56,
//
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Expanded(
// child: Center(
// child: Text(
// formattedSerialNumber,
// //style: DocDefineTableData.customTextStyle(context),
// style:  DocumentTypeDataStyle.customTextStyle(context),
// textAlign: TextAlign.start,
// )),
// ),
// Expanded(
// child: Center(
// child: Text(
// MCRdata.idOfDocument,
// //style: DocDefineTableData.customTextStyle(context),
// style:  DocumentTypeDataStyle.customTextStyle(context),
// ),
// ),
// ),
// Expanded(
// child: Center(
// child: Text(
// MCRdata.docName.toString(),
// // style:DocDefineTableData.customTextStyle(context),
// style:  DocumentTypeDataStyle.customTextStyle(context),
// )),
// ),
// Expanded(
// child: Center(
// child: Text(
// MCRdata.expiryReminder.toString(),
// // style: DocDefineTableData.customTextStyle(context),
// style:  DocumentTypeDataStyle.customTextStyle(context),
// )),
// ),
// Expanded(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// IconButton(
// onPressed: (){
// String? selectedExpiryType = expiryType;
// showDialog(context: context, builder: (context){
// return  FutureBuilder<NewOrgDocument>(
// future: getPrefillNewOrgDocument(context,MCRdata.orgDocumentSetupid),
// builder: (context,snapshotPrefill) {
// if(snapshotPrefill.connectionState == ConnectionState.waiting){
// return Center(
// child: CircularProgressIndicator(color: ColorManager.blueprime,),
// );
// }
//
// var name = snapshotPrefill.data!.docName;
// docNameController = TextEditingController(text: snapshotPrefill.data!.docName);
//
// var expiry = snapshotPrefill.data!.expiryType;
// String? selectedExpiryType = expiry;
//
// return StatefulBuilder(
// builder: (BuildContext context, void Function(void Function()) setState) {
// return OrgDocNewEditPopup(
// title: EditPopupString.editDME,
// orgDocumentSetupid: snapshotPrefill.data!.orgDocumentSetupid,
// docTypeId: snapshotPrefill.data!.documentTypeId,
// subDocTypeId: snapshotPrefill.data!.documentSubTypeId,
// idOfDoc: snapshotPrefill.data!.idOfDocument,
// docName: snapshotPrefill.data!.docName,
// expiryType: snapshotPrefill.data!.expiryType,
// threshhold: snapshotPrefill.data!.threshold,
// expiryDate: snapshotPrefill.data!.expiryDate,
// expiryReminder: snapshotPrefill.data!.expiryReminder,
// docTypeText: AppString.vendorContracts,
// subDocTypeText: AppStringEM.dme,
// );
// },
// );
// }
// );
// });
// },
// icon: Icon(Icons.edit_outlined,
// size:IconSize.I18,color: IconColorManager.bluebottom,)),
// IconButton(
// onPressed: (){
// showDialog(context: context,
// builder: (context) => StatefulBuilder(
// builder: (BuildContext context, void Function(void Function()) setState) {
// return  DeletePopup(
// title: DeletePopupString.deleteDME,
// loadingDuration: _isLoading,
// onCancel: (){
// Navigator.pop(context);
// }, onDelete: () async{
// setState(() {
// _isLoading = true;
// });
// try {
// await deleteNewOrgDoc(
// context,
// snapshot.data![index].orgDocumentSetupid);
// getNewOrgDocfetch(context,AppConfig.vendorContracts,AppConfig.subDocId8DME,1,50).then((data) {
// _controller.add(data);
// }).catchError((error) {
// // Handle error
// });
// } finally {
// setState(() {
// _isLoading = false;
// });
// Navigator.pop(context);
// }
//
// });
// },
//
// ));
// }, icon: Icon(Icons.delete_outline,size:IconSize.I18,color: IconColorManager.red,)),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// );
// },
// ),
// ),
// PaginationControlsWidget(
// currentPage: currentPage,
// items: snapshot.data!,
// itemsPerPage: itemsPerPage,
// onPreviousPagePressed: () {
// setState(() {
// currentPage = currentPage > 1 ? currentPage - 1 : 1;
// });
// },
// onPageNumberPressed: (pageNumber) {
// setState(() {
// currentPage = pageNumber;
// });
// },
// onNextPagePressed: () {
// setState(() {
// currentPage = currentPage < totalPages
// ? currentPage + 1
//     : totalPages;
// });
// },
// )
// ],
// );
// }
// return Offstage();
// }
// ),
// ),