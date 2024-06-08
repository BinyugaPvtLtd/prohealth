import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/login_module/update_password/widgets/update_password_mobile.dart';
import 'package:prohealth/presentation/screens/login_module/update_password/widgets/update_password_tab.dart';
import 'package:prohealth/presentation/screens/login_module/update_password/widgets/update_password_web.dart';
import '../../../widgets/responsive_screen.dart';

class UpdatePassword extends StatelessWidget {
  final String email;
  final String otp;

  const UpdatePassword({super.key, required this.email, required this.otp});
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreen(
        mobile: MobileUpdatePass(email: email, otp: otp,),
        web: NewPasswordScreenWeb(email: email, otp: otp,),
        tablet: TabUpdatePass(email: email, otp: otp,));
  }
}
