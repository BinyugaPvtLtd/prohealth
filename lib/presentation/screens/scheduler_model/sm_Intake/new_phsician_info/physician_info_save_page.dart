import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/sm_module_manager/intake/intake_physician_info_manager.dart';
import '../../../../../data/api_data/sm_data/sm_intake_data/sm_physician_info/physician_info.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';

class SavePagePhysicianInfo extends StatefulWidget {
  final VoidCallback onEdit;

  const SavePagePhysicianInfo({Key? key, required this.onEdit}) : super(key: key);

  @override
  State<SavePagePhysicianInfo> createState() => _SavePagePhysicianInfoState();
}

class _SavePagePhysicianInfoState extends State<SavePagePhysicianInfo> {
  late bool isSaved;

  String? name;
  String? street;
  String? suite;
  String? city;
  String? state;
  String? zipCode;
  String? phone;
  String? fax;
  String? email;
  String? npi;
  String? upi;
  String? protocol;
  String? notes;
  String? verificationDetails;
  String? pecosStatus;

  bool _isLoading = true;




  @override
  void initState() {
    super.initState();
    _prefillPhysicianData();
  }


  Future<void> _prefillPhysicianData() async {
    final provider = Provider.of<DiagnosisProvider>(context, listen: false);

    try {
      List<PhysicianInfoPrefillData> prefilledData = await getPhysicianInfoById(
        context: context,
        patientId: provider.patientId,
      );

      if (prefilledData.isNotEmpty) {
        final data = prefilledData.first;

        setState(() {
          name = '${data.phyFirstName} ${data.phyLastName}, ${data.phySuffix ?? ""}';
          street = data.phyStreet ?? '';
          suite = data.phySuite ?? '';
          city = data.phyCity ?? '';
          state = data.phyState ?? '';
          zipCode = data.phyZipCode ?? '';
          phone = data.phyContact ?? '';
          fax = data.phyFax ?? '';
          email = data.phyEmail ?? '';
          npi = data.phyNPI?.toString() ?? '';
          upi = data.phyUPI ?? '';
          protocol = data.phyProtocols ?? '';
          notes = data.phyNotes ?? '';
          verificationDetails = data.phyVerificationDetails ?? '';
          pecosStatus = data.phyPicoNo ?? 'UNKNOWN';
        });
      }
    } catch (e) {
      print('Failed to load prefilled data: $e');
    } finally {
      setState(() {
        _isLoading = false; // ✅ Done loading
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final double spacing  =  MediaQuery.of(context).size.width * 0.05;;
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 120,
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFF008000),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Verified",
                        style: CustomTextStylesCommon.commonStyle(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.white,
                        )),
                    Image.asset(
                      "images/sm/white_tik.png",
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// First Column Group
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Labels
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text('Name :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('Street :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('Suite/Apt# :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('City :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('State :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('Zip Code :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('Phone Number :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('Fax Number :', style: ThemeManagerDark.customTextStyle(context)),
                        ],
                      ),
                    ),

                    // Values
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(name ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(street ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(suite ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(city ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(state ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(zipCode ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(phone ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(fax ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),



                          ///
                          // Text("Alexander Wulffe, MD", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text("1800 Oak Grove Rd", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text("  ", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text("Walnut", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text("CA", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text("94586", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text("925-461-2354", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text("925-461-2333", style: ThemeManagerDarkFont.customTextStyle(context)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

               SizedBox(width: spacing),

              /// Second Column Group
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Labels
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text('NPI Number :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('UPI Number :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('Email :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('Protocols :', style: ThemeManagerDark.customTextStyle(context)),
                          Text('Notes :', style: ThemeManagerDark.customTextStyle(context)),
                        ],
                      ),
                    ),

                    // Values
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(npi ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(upi ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(email ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(protocol ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                          Text(notes ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),

                          // Text("12344785558", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text(" ", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text(" ", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text(" ", style: ThemeManagerDarkFont.customTextStyle(context)),
                          // Text(" ", style: ThemeManagerDarkFont.customTextStyle(context)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

               SizedBox(width: spacing),

              /// Third Column Group (PECOS Status)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 15,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('PECOS Status :', style: ThemeManagerDark.customTextStyle(context)),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                              pecosStatus ?? 'UNKNOWN',           //"ENROLLED",
                              style: CustomTextStylesCommon.commonStyle(
                                fontSize: FontSize.s12,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff04BF00),
                              )),
                        ),
                      ],
                    ),
                    Text('Verification Details :', style: ThemeManagerDark.customTextStyle(context)),
                    Text(verificationDetails ?? '', style: ThemeManagerDarkFont.customTextStyle(context)),
                    // Text("Confirmed by Natalie MA at Dr. Wulffe’s office", style: ThemeManagerDarkFont.customTextStyle(context)),
                    // Text("1/26/2025, 8:17:00 AM PST by Henry, Rebecca", style: ThemeManagerDarkFont.customTextStyle(context)),
                  ],
                ),
              ),

               SizedBox(width: spacing),

              /// Fourth Column (Edit Button)
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: widget.onEdit,
                      icon: Icon(
                        Icons.edit_outlined,
                        color: ColorManager.bluebottom,
                        size: IconSize.I22,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
