import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_lab_result/widget/lab_result_add_pop_up.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../widgets/constant_widgets/button_constant.dart';

class IntakeLabResultScreen extends StatefulWidget {
  const IntakeLabResultScreen({super.key});

  @override
  State<IntakeLabResultScreen> createState() => _IntakeLabResultScreenState();
}

class _IntakeLabResultScreenState extends State<IntakeLabResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Status: Not Completed',
                    style: GoogleFonts.firaSans(
                        decoration: TextDecoration.none,
                        fontSize: 12.0,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.burnt_red
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/60),
                  Container(
                    height: AppSize.s32,
                    width: AppSize.s105,
                    child: SchedularIconButtonConst(
                        text: 'Add New',
                        icon: Icons.add,
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return LabResultAddPopUp();
                            },
                          );

                        }
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.width * 0.3,
                // width: MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                              child: Column(
                                children: [
                                  Container(
                                    height: AppSize.s65,
                                    // width: 1109, //1109
                                    decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Container(
                                                color: ColorManager.blueprime,
                                                height: AppSize.s45,
                                                width: AppSize.s62,
                                                child: Icon(Icons.remove_red_eye_outlined,
                                                  color: ColorManager.white,
                                                  size: AppSize.s24,),
                                              ),
                                            ),

                                            SizedBox(width: MediaQuery.of(context).size.width/120),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 11.5),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'ID: 248d1eb1-9020-4d8d-8168-43a3ef90a261',
                                                    style: GoogleFonts.firaSans(
                                                        decoration: TextDecoration.none,
                                                        fontSize: FontSize.s10,
                                                        fontWeight: FontWeightManager.medium,
                                                        color: ColorManager.granitegray
                                                    ),
                                                  ),
                                                  SizedBox(height: 3.5),
                                                  Text(
                                                    'Compliance 1',
                                                    style: GoogleFonts.firaSans(
                                                        decoration: TextDecoration.none,
                                                        fontSize: FontSize.s12,
                                                        fontWeight: FontWeightManager.bold,
                                                        color: ColorManager.granitegray
                                                    ),
                                                  ),

                                                  SizedBox(height: AppSize.s1),
                                                  Text(
                                                    'Expiry 10 months',
                                                    style: GoogleFonts.firaSans(
                                                        decoration: TextDecoration.none,
                                                        fontSize: FontSize.s10,
                                                        fontWeight: FontWeightManager.lightbold,
                                                        color: ColorManager.granitegray
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width/4.5), //3.5
                                        Padding(
                                          padding: const EdgeInsets.only(right: 50.0),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.history,
                                                  color: ColorManager.granitegray,
                                                ),
                                                onPressed: () {
                                                },
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width/120),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.print_outlined,
                                                  color: ColorManager.granitegray,
                                                ),
                                                onPressed: () async {
                                                  final pdf = pw.Document();

                                                  pdf.addPage(
                                                    pw.Page(
                                                      build: (pw.Context context) => pw.Center(
                                                        child: pw.Text('Hello, this is a test print!'),
                                                      ),
                                                    ),
                                                  );

                                                  await Printing.layoutPdf(
                                                    onLayout: (PdfPageFormat format) async => pdf.save(),
                                                  );
                                                },
                                              ),

                                              SizedBox(width: MediaQuery.of(context).size.width/120),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.file_download_outlined,
                                                  color:ColorManager.granitegray,
                                                ),
                                                onPressed: () {

                                                },
                                              ),

                                              SizedBox(width: MediaQuery.of(context).size.width/120),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.delete_outline,
                                                  color:ColorManager.granitegray,
                                                ),
                                                onPressed: () {

                                                },
                                              ),
                                            ],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
