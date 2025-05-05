import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_tab_widget/widget/ci_org_doc_tab/widgets/heading_constant_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../app/constants/app_config.dart';
import '../../../../../../../../../../app/resources/provider/delete_popup_provider.dart';
import '../../../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../../../../../app/services/api/managers/establishment_manager/new_org_doc/new_org_doc.dart';
import '../../../../../../../../../../data/api_data/establishment_data/company_identity/new_org_doc.dart';
import '../../../../../../../../../widgets/error_popups/delete_success_popup.dart';
import '../../../files_constant-widget.dart';
import '../org_add_popup_const.dart';

class VendorContractMISCProvider extends ChangeNotifier {
  // Controllers
  TextEditingController docNameController = TextEditingController();
  TextEditingController docIdController = TextEditingController();
  TextEditingController calenderController = TextEditingController();
  TextEditingController idOfDocController = TextEditingController();
  TextEditingController daysController = TextEditingController(text: "1");

  // StreamController
  final StreamController<List<NewOrgDocument>> reportController = StreamController<List<NewOrgDocument>>();

  // State Variables
  int currentPage = 1;
  bool isLoading = false;
  String? expiryType;
  String? selectedValue;
  String? selectedYear = AppConfig.year;

  // Methods
  void setCurrentPage(int pageNumber) {
    currentPage = pageNumber;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
  Future<void> onDelete(NewOrgDocument doc, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return DeletePopupProvider(
          title: DeletePopupString.deleteMISC,
          loadingDuration: isLoading,
          onCancel: () {
            Navigator.pop(context);
          },
          onDelete: () async {
            setLoading(true); // Set loading state
            try {
              await deleteNewOrgDoc(context, doc.orgDocumentSetupid);
              Navigator.pop(context); // Close the confirmation dialog
              showDialog(
                context: context,
                builder: (context) => DeleteSuccessPopup(),
              );
            } finally {
              setLoading(false); // Reset loading state
            }
          },
        );
      },
    );
  }

  Future<void> onEdit(NewOrgDocument doc, BuildContext context) async {
    var snapshotPrefill = await getPrefillNewOrgDocument(context, doc.orgDocumentSetupid);

    docNameController.text = snapshotPrefill.docName ?? "";

    showDialog(
      context: context,
      builder: (context) {
        return OrgDocNewEditPopup(
          title: EditPopupString.editMISC,
          orgDocumentSetupid: snapshotPrefill.orgDocumentSetupid ?? 0,
          docTypeId: snapshotPrefill.documentTypeId ?? 0,
          subDocTypeId: snapshotPrefill.documentSubTypeId ?? 0,
          idOfDoc: snapshotPrefill.idOfDocument ?? "",
          docName: snapshotPrefill.docName ?? "",
          expiryType: snapshotPrefill.expiryType,
          threshhold: snapshotPrefill.threshold ?? 0,
          expiryDate: snapshotPrefill.expiryDate,
          expiryReminder: snapshotPrefill.expiryReminder,
          docTypeText: AppStringEM.vendorContracts,
          subDocTypeText: AppStringEM.misc,
        );
      },
    );
  }

  @override
  void dispose() {
    docNameController.dispose();
    docIdController.dispose();
    calenderController.dispose();
    idOfDocController.dispose();
    daysController.dispose();
    reportController.close();
    super.dispose();
  }
}

class VendorContractMISC extends StatelessWidget {
  final int docId;
  final int subDocId;

  const VendorContractMISC({
    super.key,
    required this.docId,
    required this.subDocId,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VendorContractMISCProvider>(context);

    return Column(
      children: [
        TableHeadingConst(),
        SizedBox(height: AppSize.s10),
        PoliciesProcedureList(
          controller: provider.reportController,
          fetchDocuments: (context) => getNewOrgDocfetch(
            context,
            AppConfig.vendorContracts,
            AppConfig.subDocId10MISC,
            1,
            50,
          ),
          emptyMessage: ErrorMessageString.noMISC,
          onEdit: (NewOrgDocument doc) {
            provider.onEdit(doc, context);
          },
          onDelete: (NewOrgDocument doc) {
            provider.onDelete(doc, context);
          },
        ),
      ],
    );
  }
}
