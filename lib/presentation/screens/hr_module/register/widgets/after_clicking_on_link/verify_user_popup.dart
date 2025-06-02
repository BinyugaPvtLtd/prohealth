import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prohealth/app/services/api/managers/auth/auth_manager.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/progress_form_manager/offer_letter_manager.dart';
import 'package:prohealth/app/services/token/token_manager.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'package:prohealth/data/api_data/hr_module_data/offer_letter_html_data/offer_letter_html.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../../../app/services/api/managers/hr_module_manager/progress_form_manager/onboarding_verifyuser_manager.dart';
import '../../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../taxtfield_constant.dart';
import 'on_boarding_welcome.dart';



class VerifyUserpopup extends StatefulWidget {


  const VerifyUserpopup({super.key, });
  @override
  VerifyUserpopupState createState() => VerifyUserpopupState();
}

class VerifyUserpopupState extends State<VerifyUserpopup> {
  final List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());

  bool _isVerifyingOTP = false;
  String? _errorMessage = "";

  Future<void> _verifyOTPAndProcess(String email,) async {
    setState(() {
      _isVerifyingOTP = true;
      _errorMessage = "";
    });
    String enteredOTP = otpControllers.map((controller) => controller.text).join();
    try {
      ApiDataRegister result = await AuthManager.verifyOTPAndRegister(
          email: email, otp: enteredOTP, context: context);

      if (result.success) {
        print('Success navigate');
        int employeeIdRegister = 0;
        String email =  await TokenManager.getEmailIdRegister();
        int companyId = await TokenManager.getCompanyIdRegister();
        int depID = await TokenManager.getdepIdRegister();
        EmployeeIdByEmail result = await GetEmployeeIdByEmail(context, companyId, email);
        employeeIdRegister = result.employeeID;

        print('EmployeeId :::: ${employeeIdRegister}');
        print('depppp :::: ${depID}');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: OnBoardingCongratulation(employeeId: employeeIdRegister, depID: depID),
            );
          },
        );
      } else {
        setState(() {
          _errorMessage = "Incorrect OTP! Try Again";
        });
      }
      setState(() {
        _isVerifyingOTP = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Timer? _timer;
  int _remainingTime = 59;
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool otpEnabled = false;
  bool emailEntered = false;
  bool isLoading = false;
  bool isOtpLoading = false;

  bool _isEmailValid(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
  }

  FocusNode emailFocusNode = FocusNode();
  FocusNode otpFocusNode = FocusNode();
  FocusNode getOtpButtonFocusNode = FocusNode();
  FocusNode submitButtonFocusNode = FocusNode();


  void _pressGetOtpButton() {
    if (emailEntered) {
      setState(() {
        isLoading = true;
        otpEnabled = true;
        _remainingTime = 59; // Reset timer
        _startTimer(); // Start timer
      });
      _formKey.currentState!.validate();
      postverifyuser(context, emailController.text);
      Future.delayed(
        const Duration(seconds: 2),
            () {
          setState(() {
            isLoading = false;
            emailEntered = false;
          });
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.white,
      child: SizedBox(
        //width: MediaQuery.of(context).size.width * 0.2,
        width: 420,
       // height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Header Row
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xff50B5E5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Icon(
                          FontAwesomeIcons.userCheck,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          AppString.verify_user,
                          style:PopupBlueBarText.customTextStyle(context),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height / 50),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,     //20,
                  vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Email Input Field
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email',style: AllPopupHeadings.customTextStyle(context)),
                          SizedBox(height: 5),
                          TextFormField(
                            cursorColor: Colors.black,
                            controller: emailController,
                            style: onlyFormDataStyle.customTextStyle(context),
                            decoration: InputDecoration(
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(color: Color(0xffB1B1B1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(color: Color(0xffB1B1B1)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(color: Color(0xffB1B1B1)),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                emailEntered = _isEmailValid(value);
                              });
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(getOtpButtonFocusNode);
                              _pressGetOtpButton();  // Trigger the OTP button press
                            },

                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Get OTP Button
                    isLoading
                        ? SizedBox(
                      height: 27,
                      width: 27,
                      child: CircularProgressIndicator(
                        color: ColorManager.blueprime,
                      ),
                    )
                        : ElevatedButton(
                      focusNode: getOtpButtonFocusNode,
                      autofocus: true,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF50B5E5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: emailEntered
                          ? () async {
                        _pressGetOtpButton();
                        // setState(() {
                        //   isLoading = true;
                        //   otpEnabled = true;
                        //   _remainingTime = 59; // Reset timer
                        //   _startTimer(); // Start timer
                        // });
                        // _formKey.currentState!.validate();
                        // await postverifyuser(
                        //     context, emailController.text);
                        // Future.delayed(
                        //   const Duration(seconds: 2),
                        //       () {
                        //     setState(() {
                        //       isLoading = false;
                        //       emailEntered = false;
                        //     });
                        //   },
                        // );
                      }
                          : null,
                      child: Text('Get OTP',
                          style: BlueButtonTextConst.customTextStyle(context)),
                    ),
                    const SizedBox(height: 20),

                    // OTP Input Fields
                    Container(
                      //  color: Colors.red,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('OTP', style: AllPopupHeadings.customTextStyle(context)),
                          const SizedBox(height: 5),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: List.generate(
                              6,
                                  (index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 50,
                                  height: MediaQuery.of(context).size.height / 19,
                                  // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 150),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.26),
                                    border: Border.all(
                                      color: Color(0xffB1B1B1),
                                      width: 0.85,
                                    ),
                                  ),
                                  child: Focus(
                                    onKey: (node, event) {
                                      if (event is RawKeyDownEvent) {
                                        if (event.logicalKey == LogicalKeyboardKey.backspace) {
                                          if (otpControllers[index].text.isEmpty && index > 0) {
                                            _focusNodes[index].unfocus();
                                            otpControllers[index].clear();
                                            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                                            return KeyEventResult.handled;
                                          }
                                        }
                                      }
                                      return KeyEventResult.ignored;
                                    },
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      controller: otpControllers[index],
                                      focusNode: _focusNodes[index],
                                      style: onlyFormDataStyle.customTextStyle(context),
                                      enabled: otpEnabled,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      textAlignVertical: TextAlignVertical.center,
                                      maxLength: 1,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(bottom: 18),
                                        counterText: '',
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty && index < 5) {
                                          // Move focus to the next field
                                          FocusScope.of(context)
                                              .requestFocus(_focusNodes[index + 1]);
                                        } else if (value.isNotEmpty && index == 5) {
                                          // Last field, perform action (e.g., verify OTP)
                                          _verifyOTPAndProcess(emailController.text);
                                        }
                                        // if (value.isNotEmpty) {
                                        //   // Move to the next field if not empty and not the last index
                                        //   if (index < 5) {
                                        //     FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                                        //   }
                                        // } else if (value.isEmpty && index > 0) {
                                        //   // Move to the previous field when empty, only if not the first field
                                        //   FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                                        // } else if (value.isNotEmpty && index == 5) {
                                        //   // Perform OTP verification when the last field is filled
                                        //   _verifyOTPAndProcess(emailController.text);
                                        // }
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only digits
                                      ],
                                      // onEditingComplete: () {
                                      //   if (index < 5 && otpControllers[index].text.isNotEmpty) {
                                      //     // Move to the next field when editing is complete and not the last index
                                      //     FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                                      //   } else if (index == 5) {
                                      //     // If it's the last field, trigger OTP verification
                                      //     _verifyOTPAndProcess(emailController.text);
                                      //   }
                                      // },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),




                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: List.generate(
                          //     6,
                          //         (index) {
                          //       return Container(
                          //         width: MediaQuery.of(context).size.width / 50,
                          //         height: MediaQuery.of(context).size.height / 19,
                          //         margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 150),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(2.26),
                          //           border: Border.all(
                          //             color: ColorManager.bluecontainer,
                          //             width: 0.85,
                          //           ),
                          //         ),
                          //         child: Focus(
                          //           onKey: (node, event) {
                          //             if (event is RawKeyDownEvent) {
                          //               if (event.logicalKey == LogicalKeyboardKey.backspace) {
                          //                 if (otpControllers[index].text.isEmpty && index > 0) {
                          //                   // Clear current field and move focus to the previous field
                          //                   otpControllers[index].clear(); // Clear the current OTP field
                          //                   FocusScope.of(context).requestFocus(_focusNodes[index - 1]); // Move to previous field
                          //                   return KeyEventResult.handled;
                          //                 }
                          //               }
                          //             }
                          //             return KeyEventResult.ignored;
                          //           },
                          //           child: TextFormField(
                          //             cursorColor: Colors.black,
                          //             controller: otpControllers[index],
                          //             style: onlyFormDataStyle.customTextStyle(context),
                          //             enabled: otpEnabled,
                          //             keyboardType: TextInputType.number,
                          //             textAlign: TextAlign.center,
                          //             textAlignVertical: TextAlignVertical.center,
                          //             maxLength: 1,
                          //             decoration: const InputDecoration(
                          //               contentPadding: EdgeInsets.only(bottom: 18),
                          //               counterText: '',
                          //               focusedBorder: InputBorder.none,
                          //               enabledBorder: InputBorder.none,
                          //               errorBorder: InputBorder.none,
                          //               disabledBorder: InputBorder.none,
                          //             ),
                          //             onChanged: (value) {
                          //               if (value.isNotEmpty && index < 5) {
                          //                 FocusScope.of(context).nextFocus(); // Move to the next field
                          //               } else if (value.isEmpty && index > 0) {
                          //                 FocusScope.of(context).previousFocus(); // Move to the previous field
                          //               } else if (value.isNotEmpty && index == 5) {
                          //                 // Last field, perform action (e.g., verify OTP)
                          //                 _verifyOTPAndProcess(emailController.text);
                          //               }
                          //             },
                          //             inputFormatters: [
                          //               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only digits
                          //             ],
                          //             onEditingComplete: () {
                          //               if (index < 5) {
                          //                 FocusScope.of(context).requestFocus(_focusNodes[index + 1]); // Move focus to the next field
                          //               } else {
                          //                 _verifyOTPAndProcess(emailController.text); // Perform OTP verification when the last field is completed
                          //               }
                          //             },
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),



                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Timer Display
                    otpEnabled
                        ? _remainingTime > 0
                        ? Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Text(
                          '00:${_remainingTime.toString().padLeft(2, '0')}',
                          style: onlyFormDataStyle.customTextStyle(context),
                        ),
                      ),
                    )
                        : _remainingTime == 0
                        ? InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () async {
                        await postverifyuser(context, emailController.text);
                        _remainingTime = 59;
                        _startTimer();
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: Text(
                            'Resend OTP',
                            style: TextStyle(
                                fontSize: FontSize.s12,
                                color: ColorManager.blueprime,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                        : const SizedBox()
                        : const SizedBox(),

                    // Display the error message below the timer
                    if (_errorMessage != null && _errorMessage!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                        child: const SizedBox(height:12),
                      ),

                    // Submit Button
                    isOtpLoading
                        ? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: ColorManager.blueprime,
                      ),
                    )
                        : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF50B5E5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: otpEnabled
                          ? () async {
                        if (_formKey.currentState!.validate()) {
                          String email = emailController.text;

                          setState(() {
                            isOtpLoading = true;
                          });
                          await _verifyOTPAndProcess(email);
                          Future.delayed(
                            const Duration(seconds: 2),
                                () {
                              setState(() {
                                isOtpLoading = false;
                              });
                            },
                          );

                          // emailController.clear();
                        } else {
                          return print('OTP not valid');
                        }
                      }
                          : null,
                      child: _isVerifyingOTP
                          ? Text(AppString.verify, style: BlueButtonTextConst.customTextStyle(context))
                          : Text('Submit', style: BlueButtonTextConst.customTextStyle(context)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}















///
///
///
///
///


////error popup show
// class VerifyUserpopup extends StatefulWidget {
//
//
//   const VerifyUserpopup({super.key, });
//   @override
//   VerifyUserpopupState createState() => VerifyUserpopupState();
// }
//
// class VerifyUserpopupState extends State<VerifyUserpopup> {
//   final List<TextEditingController> _otpControllers =
//       List.generate(6, (_) => TextEditingController());
//
//   bool _isVerifyingOTP = false;
//   String? _errorMessage = "";
//
//   Future<void> _verifyOTPAndProcess(String email,) async {
//     setState(() {
//       _isVerifyingOTP = true;
//       _errorMessage = "";
//     });
//     String enteredOTP = otpControllers.map((controller) => controller.text).join();
//     try {
//       ApiDataRegister result = await AuthManager.verifyOTPAndRegister(
//           email: email, otp: enteredOTP, context: context);
//
//       if (result.success) {
//
//         print('Success navigate');
//         int employeeIdRegister = 0;
//         String email =  await TokenManager.getEmailIdRegister();
//         int companyId = await TokenManager.getCompanyIdRegister();
//         int depID = await TokenManager.getdepIdRegister();
//         EmployeeIdByEmail result = await GetEmployeeIdByEmail(context, companyId, email);
//         employeeIdRegister = result.employeeID;
//
//
//
//
//         print('EmployeeId :::: ${employeeIdRegister}');
//         print('depppp :::: ${depID}');
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return Dialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               child: OnBoardingCongratulation(employeeId: employeeIdRegister, depID: depID,  ),
//             );
//           },
//         );
//       } else {
//         await showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return const AddFailePopup(
//               message: "Incorrect OTP! Try Again",
//             );
//           },
//         );
//         setState(() {
//           _errorMessage = result.message;
//         });
//       }
//       setState(() {
//         _isVerifyingOTP = false;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Timer? _timer;
//   int _remainingTime = 59;
//   void _startTimer() {
//     _timer?.cancel(); // Cancel any existing timer
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingTime > 0) {
//           _remainingTime--;
//         } else {
//           timer.cancel();
//         }
//       });
//     });
//   }
//
//   final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
//
//   @override
//   void dispose() {
//     for (var controller in _otpControllers) {
//       controller.dispose();
//     }
//     for (var node in _focusNodes) {
//       node.dispose();
//     }
//     super.dispose();
//   }
//
//   TextEditingController emailController = TextEditingController();
//   //TextEditingController otpController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   FocusNode emailFocusNode = FocusNode();
//   FocusNode otpFocusNode = FocusNode();
//   FocusNode getOtpButtonFocusNode = FocusNode();
//   FocusNode submitButtonFocusNode = FocusNode();
//
//   bool otpEnabled = false;
//   bool emailEntered = false;
//   bool isLoading = false;
//   bool isOtpLoading = false;
//
//   bool _isEmailValid(String email) {
//     return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
//   }
//   List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());
//   //List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       backgroundColor: Colors.white,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.3,
//         height: MediaQuery.of(context).size.height * 0.55,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Container(
//               height: 40,
//               decoration: const BoxDecoration(
//                 color: Color(0xff50B5E5),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(13),
//                   topRight: Radius.circular(13),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 16),
//                     child: Row(
//                       children: [
//                       Icon(
//                       FontAwesomeIcons.userCheck,
//                         color: Colors.white,
//                       size: 12,
//                     ),
//                     //     const Icon(
//                     //         Icons.verified_user_outlined,
//                     //         color: Colors.white, size: 16),
//                         const SizedBox(width: 10),
//                         Text(
//                           AppString.verify_user,
//                           style:PopupBlueBarText.customTextStyle(context),
//                         ),
//                       ],
//                     ),
//                   ),
//                   IconButton( splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     hoverColor: Colors.transparent,
//                     icon:
//                         const Icon(Icons.close, color: Colors.white,// size: 16
//                         ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 50),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     SizedBox(
//                       // padding: EdgeInsets.all(10),
//                       width: MediaQuery.of(context).size.width / 5,
//                       //height:30,   // MediaQuery.of(context).size.height / 25,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Email',style: AllPopupHeadings.customTextStyle(context),),
//                           SizedBox(height: 5,),
//                           TextFormField(
//                             cursorColor: Colors.black,
//
//                             controller: emailController,
//                             style: onlyFormDataStyle.customTextStyle(context),
//                             focusNode: emailFocusNode,
//                             decoration: new InputDecoration(
//                               // contentPadding: EdgeInsets.only(
//                               //           bottom: AppPadding.p5, left: AppPadding.p20),
//                               isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                                 borderSide: const BorderSide(
//                                   color: Color(0xffB1B1B1),
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                                 borderSide: const BorderSide(
//                                   color: Color(0xffB1B1B1),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                                 borderSide: const BorderSide(
//                                   color: Color(0xffB1B1B1),
//                                 ),
//                               ),
//                             ),
//                             onChanged: (value) {
//                               setState(() {
//                                 emailEntered = _isEmailValid(value);
//                               });
//                             },
//
//                             onFieldSubmitted: (value) {
//                               FocusScope.of(context).requestFocus(getOtpButtonFocusNode);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     isLoading
//                         ? SizedBox(
//                             height: 25,
//                             width: 25,
//                             child: CircularProgressIndicator(
//                               color: ColorManager.blueprime,
//                             ),
//                           )
//                         : ElevatedButton(
//                           focusNode: getOtpButtonFocusNode,
//                           autofocus: true,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF50B5E5),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                             ),
//                           ),
//                           onPressed: emailEntered
//                               ? () async {
//                                   setState(() {
//                                     isLoading = true;
//                                     otpEnabled = true;
//                                     _remainingTime = 59; // Reset timer
//                                     _startTimer(); // Start timer
//                                   });
//                                   _formKey.currentState!.validate();
//                                   await postverifyuser(
//                                       context, emailController.text);
//                                   Future.delayed(
//                                     const Duration(seconds: 2),
//                                     () {
//                                       setState(() {
//                                         isLoading = false;
//                                         emailEntered = false;
//                                       });
//                                     },
//                                   );
//                                 }
//                               : null,
//                           child: Text('Get OTP',
//                               style: BlueButtonTextConst.customTextStyle(context)),
//                         ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 5,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'OTP',
//                             style: AllPopupHeadings.customTextStyle(context),
//                           ),
//                           const SizedBox(height: 5),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: List.generate(6, (index) {
//                               return SizedBox(
//                                 width: 40, // Width of each box
//                                   child: TextFormField(
//                                     cursorColor: Colors.black,
//                                     controller: otpControllers[index],
//                                     style: onlyFormDataStyle.customTextStyle(context),
//                                     enabled: otpEnabled,
//                                     focusNode: _focusNodes[index],
//                                     decoration: InputDecoration(
//                                       isDense: true,
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(5.0),
//                                         borderSide: const BorderSide(
//                                           color: Color(0xffB1B1B1),
//                                         ),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(5.0),
//                                         borderSide: const BorderSide(
//                                           color: Color(0xffB1B1B1),
//                                         ),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(5.0),
//                                         borderSide: const BorderSide(
//                                           color: Color(0xffB1B1B1),
//                                         ),
//                                       ),
//                                     ),
//                                     onChanged: (value) {
//                                       if (value.isNotEmpty && index < 5) {
//                                         FocusScope.of(context).nextFocus();
//                                       } else if (value.isEmpty && index > 0) {
//                                         FocusScope.of(context).previousFocus();
//                                       }else if (value.isNotEmpty && index == 5) {
//                                         // Last field, perform action (e.g., verify OTP)
//                                         _verifyOTPAndProcess(emailController.text,);
//                                       }
//                                     },
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Enter digit';
//                                       }
//                                       return null;
//                                     },
//                                     inputFormatters: [
//                                       FilteringTextInputFormatter.digitsOnly, // Only allow digits
//                                       LengthLimitingTextInputFormatter(1), // Limit to one character
//                                     ],
//                                     textAlign: TextAlign.center, // Center text in the box
//                                     keyboardType: TextInputType.number,
//                                   ),
//                               );
//                             }),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     otpEnabled
//                         ? _remainingTime > 0
//                             ? Align(
//                                 alignment: Alignment.centerRight,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(right: 55),
//                                   child: Text(
//                                     '00:${_remainingTime.toString().padLeft(2, '0')}',
//                                     style:  onlyFormDataStyle.customTextStyle(context),)
//                                 ),
//                               )
//                             : _remainingTime == 0
//                                 ? InkWell(
//                                     splashColor: Colors.transparent,
//                                     highlightColor: Colors.transparent,
//                                     hoverColor: Colors.transparent,
//                                     onTap: () async {
//                                       await postverifyuser(
//                                           context, emailController.text);
//                                       _remainingTime = 59;
//                                       _startTimer();
//                                      // otpControllers.;
//                                     },
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Padding(
//                                         padding:
//                                             const EdgeInsets.only(right: 55),
//                                         child: Text(
//                                           'Resend OTP',
//                                           style:TextStyle(
//                                               fontSize: FontSize.s14,
//                                               color: ColorManager.blueprime,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 : const SizedBox(height: 20)
//                         : const SizedBox(),
//                     isOtpLoading
//                         ? SizedBox(
//                             height: 25,
//                             width: 25,
//                             child: CircularProgressIndicator(
//                               color: ColorManager.blueprime,
//                             ),
//                           )
//                         : ElevatedButton(
//                       autofocus: true,
//                             focusNode: submitButtonFocusNode,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF50B5E5),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6.0),
//                               ),
//                             ),
//                             onPressed: otpEnabled
//                                 ? () async {
//                                     if (_formKey.currentState!.validate()) {
//                                       String email = emailController.text;
//
//
//                                       setState(() {
//                                         isOtpLoading = true;
//                                         // Start timer
//                                       });
//                                       await _verifyOTPAndProcess(email,);
//                                       Future.delayed(
//                                         const Duration(seconds: 2),
//                                         () {
//                                           setState(() {
//                                             isOtpLoading = false;
//                                           });
//                                         },
//                                       );
//
//                                       emailController.clear();
//
//                                     } else {
// //Navigator.pop(context);
//                                       return print(
//                                         'OTP not valid',
//                                       );
//                                     }
//                                   }
//                                 : null,
//                             child: _isVerifyingOTP ? Text(
//                             AppString.verify ,
//                                 style: BlueButtonTextConst.customTextStyle(context)
//                             ): Text(
//                               'Submit',
//                               style: BlueButtonTextConst.customTextStyle(context)
//                             ),
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///
//
//

//////////////////////////
/////////////////
//////
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prohealth/app/resources/color.dart';
//
// import '../../../../../../app/resources/const_string.dart';
// import '../../../../../../app/resources/value_manager.dart';
// import '../../../../../../app/services/api/managers/hr_module_manager/progress_form_manager/onboarding_verifyuser_manager.dart';
// //import '../../../../../widgets/widgets/constant_textfield/const_textfield.dart';
// import '../../taxtfield_constant.dart';
// import 'on_boarding_welcome.dart';
//
// class EnterEmailAndOTPDialog extends StatefulWidget {
//   @override
//   _EnterEmailAndOTPDialogState createState() => _EnterEmailAndOTPDialogState();
// }
//
// class _EnterEmailAndOTPDialogState extends State<EnterEmailAndOTPDialog> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController otpController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   FocusNode emailFocusNode = FocusNode();
//   FocusNode Otpbutton = FocusNode();
//
//   bool otpEnabled = false;
//   bool emailEntered = false;
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       backgroundColor: Colors.white,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.3,
//         height: 300,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Container(
//               height: 50,
//               decoration: const BoxDecoration(
//                 color: Color(0xff50B5E5),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(13),
//                   topRight: Radius.circular(13),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.person_outline,
//                             color: Colors.white, size: 20),
//                         const SizedBox(width: 8),
//                         Text(
//                           AppString.verify_user,
//                           style: GoogleFonts.firaSans(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close, color: Colors.white),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: _formKey,
//                 // autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     CustomTextFieldRegister(
//                       focusNode: emailFocusNode,
//                       onFieldSubmitted: (String value) {
//                         FocusScope.of(context).requestFocus(Otpbutton);
//                       },
//                       height: AppSize.s35,
//                       width: MediaQuery.of(context).size.width / 5,
//                       controller: emailController,
//                       labelText: 'Email',
//                       keyboardType: TextInputType.text,
//                       padding: const EdgeInsets.only(
//                           bottom: AppPadding.p5, left: AppPadding.p20),
//                       onChanged: (value) {
//                         setState(() {
//                           emailEntered = value
//                               .isNotEmpty; // Update emailEntered based on email field
//                         });
//                       },
//                       validator: (value) {
//                         if (value != null) {
//                           return 'Please enter an email address';
//                         } else if (!RegExp(
//                                 r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//                             .hasMatch(value!)) {
//                           return 'Please enter a valid email address';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     isLoading
//                         ? SizedBox(
//                             height: 25,
//                             width: 25,
//                             child: CircularProgressIndicator(
//                               color: ColorManager.blueprime,
//                             ))
//                         : ElevatedButton(
//                             focusNode: Otpbutton,
//                             autofocus: true,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF50B5E5),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6.0),
//                               ),
//                             ),
//                             onPressed: emailEntered
//                                 ? () async {
//                                     setState(() {
//                                       isLoading = true;
//                                       otpEnabled = true;
//                                     });
//                                     await postverifyuser(
//                                         context, emailController.text);
//                                     Future.delayed(const Duration(seconds: 2),
//                                         () {
//                                       setState(() {
//                                         isLoading = false;
//                                       });
//                                     });
//                                   }
//                                 : null,
//                             child: const Text('Enter OTP'),
//                           ),
//                     const SizedBox(height: 20),
//                     Column(
//                       children: <Widget>[
//                         CustomTextFieldRegister(
//                           height: AppSize.s35,
//                           width: MediaQuery.of(context).size.width / 5,
//                           controller: otpController,
//                           labelText: 'Enter OTP',
//                           enabled: otpEnabled,
//                           keyboardType: TextInputType.number,
//                           padding: const EdgeInsets.only(
//                               bottom: AppPadding.p5, left: AppPadding.p20),
//                           onChanged: (value) {},
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return AppString.enterText;
//                             }
//                             return null;
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF50B5E5),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6.0),
//                         ),
//                       ),
//                       onPressed: otpEnabled
//                           ? () {
//                               if (_formKey.currentState!.validate() &&
//                                   otpController.text.isEmpty) {
//                                 // widget.onSavePressed();
//                               } else {
//                                 print(" wait");
//                                 // setState(() {
//                                 //   _documentUploaded = widget.AcknowledgementnameController.text.isNotEmpty;
//                                 // });
//                               }
//                               String email = emailController.text;
//                               String otp = otpController.text;
//                               print('Email: $email, OTP: $otp');
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return Dialog(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     child: OnBoardingCongratulation(),
//                                   );
//                                 },
//                               );
//                             }
//                           : null,
//                       child: const Text('Submit'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/////////////////

////
// Future<void> _verifyOTPAndProcess(String email, String otp) async {
//   setState(() {
//     _isVerifyingOTP = true;
//     _errorMessage = "";
//     _otpErrorMessage = null; // Clear previous OTP error message
//   });
//
//   String enteredOTP = otp;
//
//   try {
//     ApiDataRegister result = await AuthManager.verifyOTPAndRegister(
//       email: email,
//       otp: enteredOTP,
//       context: context,
//     );
//
//     if (result.success) {
//       print('Success navigate');
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: OnBoardingCongratulation(),
//           );
//         },
//       );
//     } else {
//       setState(() {
//         _otpErrorMessage = result.message; // Set OTP error message
//       });
//     }
//
//     setState(() {
//       _isVerifyingOTP = false;
//     });
//   } catch (e) {
//     print(e);
//   }
// }
