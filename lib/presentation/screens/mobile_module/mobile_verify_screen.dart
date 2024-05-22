import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/theme_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/constants/app_config.dart';
import 'package:prohealth/presentation/screens/desktop_module/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/mobile_module/widgets/mobile_const.dart';
import 'package:prohealth/presentation/screens/mobile_module/widgets/mobile_pass_screen.dart';

///
class MobileverifyScreen extends StatefulWidget {
  MobileverifyScreen({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<MobileverifyScreen> createState() => _MobileverifyScreenState();
}

class _MobileverifyScreenState extends State<MobileverifyScreen> {
  List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  bool _isVerifyingOTP = false;
  String? _errorMessage;

  ///
  Future<void> verifyOTPAndLogin() async {
    try {
      setState(() {
        _isVerifyingOTP = true;
        _errorMessage = null;
      });
      String enteredOTP =
          _otpControllers.map((controller) => controller.text).join();
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode({
        "email": widget.email.trim(),
        "otp": enteredOTP,
      });
      var dio = Dio();
      var response = await dio.post(
        '${AppConfig.endpoint}/auth/verifyotp',
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MenuScreen(),
        //   ),
        // );
      } else {
        setState(() {
          _errorMessage = AppString.incorrectOtp;
        });
      }
    } catch (e) {
      print('Error occurred during OTP verification: $e');
      setState(() {
        _errorMessage = AppString.incorrectOtp;
      });
    } finally {
      setState(() {
        _isVerifyingOTP = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileConst(
      textAction: '',
      titleText: AppString.verification,
      mobileChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Column(
          children: [
            Text(
              AppString.enter4digitotp,
              style: CustomTextStylesCommon.commonStyle(
                  color: ColorManager.darkgrey,
                  fontSize: FontSize.s10,
                  fontWeight: FontWeightManager.bold),
            ),
            SizedBox(height: 20),

            ///txtfield
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  width: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 23,
                  margin: EdgeInsets.symmetric(horizontal: AppPadding.p10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.26),
                    border: Border.all(
                      color: ColorManager.bluecontainer,
                      width: 0.85,
                    ),
                  ),
                  child: TextFormField(
                    controller: _otpControllers[index],
                    cursorColor: ColorManager.black,
                    cursorHeight: 20,
                    cursorWidth: 2,
                    cursorRadius: Radius.circular(1),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: AppSize.s15),
                      counterText: '',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    validator: (value) {
                      return value!.isEmpty ? AppString.otp : null;
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isNotEmpty && index == 3) {
                        verifyOTPAndLogin();
                      }
                    },
                  ),
                ),
              ),
            ),

            ///didnt receive code
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppString.didntrecieveCode,
                    style: CustomTextStylesCommon.commonStyle(
                      color: ColorManager.grey,
                      fontSize: FontSize.s10,
                      fontWeight: FontWeightManager.semiBold,
                    )),
                TextButton(
                  onPressed: () {},
                  child: Text(AppString.resend,
                      style: CustomTextStylesCommon.commonStyle(
                        color: ColorManager.blueprime,
                        fontSize: FontSize.s10,
                        fontWeight: FontWeightManager.semiBold,
                      )),
                )
              ],
            ),

            ///button
            CustomButton(
              borderRadius: 24,
              height: MediaQuery.of(context).size.height / 18,
              width: MediaQuery.of(context).size.height / 4,
              text: _isVerifyingOTP ? AppString.verify : AppString.loginbtn,
              style: TextStyle(fontSize: 13),
              onPressed: () {
                verifyOTPAndLogin();
              },
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Text(
                  _errorMessage!,
                  style: CustomTextStylesCommon.commonStyle(
                    color: ColorManager.red,
                    fontSize: FontSize.s10,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
              ),
            SizedBox(height: 20),

            ///bottomtxt
            InkWell(
              child: Text(
                AppString.donthaveauth,
                style: CustomTextStylesCommon.commonStyle(
                  color: ColorManager.blueprime,
                  fontSize: FontSize.s10,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MobilePasswordLogIn(email: AppString.email),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
