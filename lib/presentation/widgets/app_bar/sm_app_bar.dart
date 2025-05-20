import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/app/constants/app_config.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/services/api/managers/user_appbar_manager.dart';
import 'package:prohealth/app/services/token/token_manager.dart';
import 'package:prohealth/data/api_data/establishment_data/user/user_appbar.dart';
import 'package:prohealth/presentation/screens/login_module/login/login_screen.dart';
import 'package:prohealth/presentation/widgets/app_clickable_widget.dart';
import 'package:url_launcher/url_launcher.dart' show canLaunch, launch;

import '../../../app/resources/theme_manager.dart';
import '../../../app/resources/value_manager.dart';
import '../../screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';

class SmAppBar extends StatefulWidget {
   SmAppBar({super.key, required this.headingText,required this.body,});
  final String headingText;
   final List<Widget> body;

  @override
  State<SmAppBar> createState() => _SmAppBarState();
}

class _SmAppBarState extends State<SmAppBar> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }
  // final HRController hrController = Get.put(HRController());

  String? _selectedValue;

  String? loginName = '';
  String? loginEmail = '';
  //int loginUserId = 0;
  bool isLoggedIn = true;
  Future<String> user() async {
    loginName = await TokenManager.getUserName();
    //loginName = userName;
    print("UserName login ${loginName}");
    return loginName!;
  }
  Future<String> email() async {
    loginEmail = await TokenManager.getEmail();
    //loginName = userName;
    print("loginEmail login ${loginEmail}");
    return loginEmail!;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        height: AppBar().preferredSize.height + 15,
        width: double.maxFinite,
        child:Padding(
          padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Left section: Logo + Heading
              Row(
                children: [
                  /// Logo
                  Container(
                    width: AppSize.s181,
                    margin: const EdgeInsets.only(left: AppPadding.p20),
                    child: Image.asset(
                      'images/logo_login.png',
                      fit: BoxFit.fill,
                    ),
                  ),

                  /// Heading next to logo
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 10),
                  //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(18),
                  //     color: ColorManager.white,
                  //     boxShadow: const [
                  //       BoxShadow(
                  //         color: Color(0x40000000),
                  //         blurRadius: 4,
                  //         offset: Offset(0, 4),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Row(
                  //     children: [
                  /// sm heading
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            widget.headingText,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff3E3B3B),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                  //       const SizedBox(width: AppSize.s10),
                  //       AppClickableWidget(
                  //         onTap: () {
                  //           Navigator.of(context).pushNamedAndRemoveUntil(
                  //             "/home",
                  //             ModalRoute.withName("/home"),
                  //           );
                  //         },
                  //         onHover: (bool val) {},
                  //         child: Icon(
                  //           Icons.close,
                  //           color: const Color(0xff434343),
                  //           size: MediaQuery.of(context).size.width / 100,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                ],
              ),
///sm tabbar
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: widget.body,
                  ),
                ),
              ),

              /// Right section: Profile Image + Name
              const UserAppBarWidget(),


              // Padding(
              //   padding: const EdgeInsets.only(right: 16.0), // Adjust right padding as needed
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       MouseRegion(
              //         onEnter: (_) {},
              //         onExit: (_) {},
              //         child: FutureBuilder<UserAppBar>(
              //           future: getAppBarDetails(context),
              //           builder: (context, snapshot) {
              //             Widget avatar = CircleAvatar(
              //               backgroundColor: Colors.grey[100],
              //               radius: 40,
              //               backgroundImage: AssetImage("images/profilepic.png"),
              //             );
              //
              //             if (snapshot.connectionState == ConnectionState.waiting) {
              //               return GestureDetector(child: avatar, onTap: () {});
              //             } else if (snapshot.hasData && snapshot.data!.imgUrl.isNotEmpty) {
              //               avatar = CircleAvatar(
              //                 backgroundColor: Colors.transparent,
              //                 radius: 40,
              //                 backgroundImage: NetworkImage(snapshot.data!.imgUrl),
              //               );
              //             }
              //
              //             return GestureDetector(
              //               child: avatar,
              //               onTap: () {
              //                 print("userid appbar: ${snapshot.data?.userId}");
              //               },
              //             );
              //           },
              //         ),
              //       ),
              //       const SizedBox(width: 3),
              //       FutureBuilder(
              //         future: user(),
              //         builder: (context, snap) {
              //           if (snap.connectionState == ConnectionState.waiting) {
              //             return SizedBox();
              //           }
              //
              //           return MouseRegion(
              //             onEnter: (_) {
              //               showMenu(
              //                 context: context,
              //                 position: RelativeRect.fromLTRB(70, 70, 0, 0),
              //                 items: [
              //                   PopupMenuItem(
              //                     padding: EdgeInsets.zero,
              //                     height: 30,
              //                     child: GestureDetector(
              //                       onTap: () {
              //                         if (isLoggedIn) {
              //                           showDialog(
              //                             context: context,
              //                             builder: (context) => DeletePopup(
              //                               onCancel: () => Navigator.pop(context),
              //                               onDelete: () {
              //                                 TokenManager.removeAccessToken();
              //                                 Navigator.pushNamedAndRemoveUntil(
              //                                   context,
              //                                   LoginScreen.routeName,
              //                                       (route) => false,
              //                                 );
              //                               },
              //                               btnText: "Log Out",
              //                               title: "Log Out",
              //                               text: "Do you really want to logout?",
              //                             ),
              //                           );
              //                         }
              //                       },
              //                       child: Container(
              //                         height: 25,
              //                         width: 90,
              //                         padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              //                         child: Row(
              //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                           crossAxisAlignment: CrossAxisAlignment.center,
              //                           children: [
              //                             Icon(Icons.logout, size: 12, color: Colors.black),
              //                             Text(
              //                               'Log Out',
              //                               style: TextStyle(
              //                                 fontSize: 12,
              //                                 color: Colors.black,
              //                                 fontWeight: FontWeight.w600,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               );
              //             },
              //             child: Row(
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 Text(
              //                   loginName!,
              //                   style: TextStyle(
              //                     color: ColorManager.bluebottom,
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w600,
              //                   ),
              //                 ),
              //                 const SizedBox(width: 4),
              //                 Icon(Icons.keyboard_arrow_down_outlined, color: ColorManager.bluebottom),
              //               ],
              //             ),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),



              ///
              ///
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //
              //       children: [
              //         MouseRegion(
              //           onEnter: (_) {},
              //           onExit: (_) {
              //             // Handle mouse leave
              //           },
              //           child: FutureBuilder<UserAppBar>(
              //             future: getAppBarDetails(context),
              //             builder: (context, snapshot) {
              //               if (snapshot.connectionState == ConnectionState.waiting) {
              //                 print("Future is loading...");
              //                 return GestureDetector(
              //                   child: CircleAvatar(
              //                     backgroundColor: Colors.grey[100],
              //                     radius: 13,
              //                     backgroundImage: AssetImage("images/profilepic.png"),
              //                   ),
              //                   onTap: () {
              //                     print("userid appbar (waiting state): ${snapshot.data?.userId}");
              //                   },
              //                 );
              //               } else if (snapshot.hasError || snapshot.data == null || snapshot.data!.imgUrl.isEmpty) {
              //                 print("Error or empty imgUrl or snapshot data is null");
              //                 return GestureDetector(
              //                   child: CircleAvatar(
              //                     backgroundColor: Colors.grey[100],
              //                     radius: 13,
              //                     backgroundImage: AssetImage("images/profilepic.png"),
              //                   ),
              //                   onTap: () {
              //                     print("userid appbar (error or empty imgUrl): ${snapshot.data?.userId}");
              //                   },
              //                 );
              //               } else if (snapshot.hasData && snapshot.data!.imgUrl.isNotEmpty) {
              //                 print("Data exists and imgUrl is not empty: ${snapshot.data!.imgUrl}");
              //                 return GestureDetector(
              //                   child: CircleAvatar(
              //                     backgroundColor: Colors.transparent,
              //                     radius: 13, // Adjust size as needed
              //                     backgroundImage: NetworkImage(snapshot.data!.imgUrl,),
              //
              //                     // child: ClipOval(
              //                     //   child: Image.network(
              //                     //     snapshot.data!.imgUrl,
              //                     //     fit: BoxFit.cover,
              //                     //     loadingBuilder: (context, child, loadingProgress) {
              //                     //       if (loadingProgress == null) {
              //                     //         print("Image loaded successfully");
              //                     //         return child; // When image has fully loaded
              //                     //       } else {
              //                     //         print("Image is loading...");
              //                     //         return Center(child: CircularProgressIndicator());
              //                     //       }
              //                     //     },
              //                     //     errorBuilder: (context, error, stackTrace) {
              //                     //       print("Error loading image, fallback to default");
              //                     //       // Fallback to default image if error occurs (invalid URL, etc.)
              //                     //       return Image.asset("images/profilepic.png", fit: BoxFit.cover);
              //                     //     },
              //                     //   ),
              //                     // ),
              //                   ),
              //                   onTap: () {
              //                     print("userid appbar (network image): ${snapshot.data?.userId}");
              //                   },
              //                 );
              //               } else {
              //                 print("No data or image URL empty, fallback to default");
              //                 return GestureDetector(
              //                   child: CircleAvatar(
              //                     backgroundColor: Colors.grey[100],
              //                     radius: 13,
              //                     backgroundImage: AssetImage("images/profilepic.png"),
              //                   ),
              //                   onTap: () {},
              //                 );
              //               }
              //             },
              //           ),
              //         ),
              //         const SizedBox(height: AppSize.s5),
              //         FutureBuilder(
              //           future: user(),
              //           builder: (context, snap) {
              //             if (snap.connectionState == ConnectionState.waiting) {
              //               print("User data is loading...");
              //               return SizedBox();
              //             }
              //
              //             return MouseRegion(
              //               onEnter: (_) {
              //                 // Show logout popup when hovering over username
              //                 print("Showing logout menu...");
              //                 showMenu(
              //                   context: context,
              //                   position: RelativeRect.fromLTRB(
              //                       70,
              //                       70,
              //                       0,
              //                       0), // Adjust position as needed
              //                   items: [
              //                     PopupMenuItem(
              //                       padding: EdgeInsets.zero,
              //                       height: 30,
              //                       child: GestureDetector(
              //                         onTap: () {
              //                           if (isLoggedIn) {
              //                             print("Logging out...");
              //                             // Handle logout
              //                             showDialog(
              //                               context: context,
              //                               builder: (context) => DeletePopup(
              //                                 onCancel: () {
              //                                   Navigator.pop(context);
              //                                 },
              //                                 onDelete: () {
              //                                   TokenManager.removeAccessToken();
              //                                   Navigator.pushNamedAndRemoveUntil(
              //                                     context,
              //                                     LoginScreen.routeName,
              //                                         (route) => false,
              //                                   );
              //                                 },
              //                                 btnText: "Log Out",
              //                                 title: "Log Out",
              //                                 text: "Do you really want to logout?",
              //                               ),
              //                             );
              //                           }
              //                         },
              //                         child: Container(
              //                           height: 25,
              //                           width: 90,
              //                           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              //                           child: Row(
              //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                             crossAxisAlignment: CrossAxisAlignment.center,
              //                             children: [
              //                               Icon(
              //                                 Icons.logout,
              //                                 size: 12,
              //                                 color: Colors.black,
              //                               ),
              //                               Text(
              //                                 'Log Out',
              //                                 style: TextStyle(
              //                                   fontSize: 12,
              //                                   color: Colors.black,
              //                                   fontWeight: FontWeight.w600,
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 );
              //               },
              //               child: Text(
              //                 loginName!,
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                   color:  ColorManager.bluebottom,
              //                   fontSize: 8, // Adjust font size as needed
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),






        ///
        // child: Row(
        //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     ///logo
        //     Container(
        //       width: AppSize.s181,
        //       //color: Colors.red,
        //       margin: const EdgeInsets.only(left: AppPadding.p50,),
        //       // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        //       child: Image.asset(
        //         'images/logo_login.png',
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     Container(
        //       width: MediaQuery.of(context).size.width - 242,
        //       margin: const EdgeInsets.only(left: 10, right: 0, top: 5, bottom: 5),
        //       child: Material(
        //         elevation: 8,
        //         borderRadius: const BorderRadius.only(
        //           topLeft: Radius.circular(18),
        //           bottomLeft: Radius.circular(18),
        //         ),
        //         child: Container(
        //           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        //           decoration: const BoxDecoration(
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(18),
        //               bottomLeft: Radius.circular(18),
        //             ),
        //             gradient: LinearGradient(
        //               colors: [
        //                 Color(0xff51B5E6),
        //                 Color(0xff008ABD),
        //               ],
        //               begin: Alignment.topCenter,
        //               end: Alignment.bottomCenter,
        //             ),
        //           ),
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //             child: SizedBox(
        //               width: MediaQuery.of(context).size.width - 240,
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   ///ask klip
        //                   Expanded(
        //                     flex: MediaQuery.of(context).size.width >= 1024
        //                         ? 2
        //                         : 4,
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                        Expanded(child: SizedBox()),
        //
        //                         ///Heading text
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: [
        //                             Container(
        //                               padding: const EdgeInsets.symmetric(
        //                                 vertical: 10,
        //                                 horizontal: 20,
        //                               ),
        //                               decoration: BoxDecoration(
        //                                 borderRadius: BorderRadius.circular(18),
        //                                 color: ColorManager.white,
        //                                 boxShadow: const [
        //                                   BoxShadow(
        //                                     color: Color(0x40000000),
        //                                     blurRadius: 4,
        //                                     offset: Offset(0, 4),
        //                                   ),
        //                                 ],
        //                               ),
        //                               child: Row(
        //                                 mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   Text(
        //                                     widget.headingText,
        //                                     style: TextStyle(
        //                                       fontSize: FontSize.s14,
        //                                       fontWeight: FontWeight.w700,
        //                                       color: const Color(0xff2B647F),
        //                                       decoration: TextDecoration.none,
        //                                     ),
        //                                   ),
        //                                   const SizedBox(
        //                                     width: AppSize.s10,
        //                                   ),
        //                                   AppClickableWidget(
        //                                     onTap: () {
        //                                       Navigator.of(context)
        //                                           .pushNamedAndRemoveUntil(
        //                                         "/home", // The target route name you want to go back to
        //                                         ModalRoute.withName(
        //                                             "/home"), // Condition to pop until the target route
        //                                       );
        //                                       // Navigator.push(
        //                                       //     context,
        //                                       //     MaterialPageRoute(
        //                                       //         builder: (context) =>
        //                                       //             const HomeScreen()));
        //                                     },
        //                                     onHover: (bool val) {},
        //                                     child: Icon(
        //                                       Icons.close,
        //                                       color: const Color(0xff434343),
        //                                       size: MediaQuery.of(context)
        //                                           .size
        //                                           .width /
        //                                           100,
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                             const SizedBox(
        //                               width: AppSize.s10,
        //                             ),
        //
        //                             ///add button
        //                             Container(
        //                               width: AppSize.s33,
        //                               height: AppSize.s33,
        //                               decoration: const BoxDecoration(
        //                                 shape: BoxShape.circle,
        //                                 boxShadow: [
        //                                   BoxShadow(
        //                                     color: Color(0x40000000),
        //                                     blurRadius: 4,
        //                                     offset: Offset(0, 4),
        //                                   ),
        //                                 ],
        //                                 color: Colors.white,
        //                               ),
        //                               child: Center(
        //                                 child: AppClickableWidget(
        //                                   onTap: () async {
        //                                     //const url = "http://localhost:52425/#/home";
        //                                     const url =
        //                                         "${AppConfig.deployment}/#/home";
        //                                     if (await canLaunch(url)) {
        //                                       await launch(url);
        //                                       //    Navigator.push(
        //                                       //      context,
        //                                       //      MaterialPageRoute(
        //                                       //       builder: (context) => OnBoardingWelcome(),
        //                                       //     ),
        //                                       //    );
        //                                     } else {
        //                                       throw 'Could not launch $url';
        //                                     }
        //                                   },
        //                                   onHover: (bool val) {},
        //                                   child: const Icon(
        //                                     Icons.add,
        //                                     color:
        //                                     Color(0xff2B647F), // Icon color
        //                                     size: 20, // Icon size
        //                                   ),
        //                                 ),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   Expanded(
        //                     flex: 2,
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //
        //                         Expanded(
        //                           flex: 3,
        //                           child: Row(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               AppClickableWidget(
        //                                 onTap: () {},
        //                                 onHover: (bool val) {},
        //                                 child: Container(
        //                                   padding: const EdgeInsets.symmetric(
        //                                       horizontal: 4, vertical: 3),
        //                                   child: const Center(
        //                                     child: Icon(
        //                                       Icons.settings_outlined,
        //                                       color: Colors.white,
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                               SizedBox(width: AppSize.s15),
        //                               AppClickableWidget(
        //                                 onTap: () {},
        //                                 onHover: (bool val) {},
        //                                 child: Container(
        //                                   // padding: const EdgeInsets.symmetric(
        //                                   //     horizontal: 5, vertical: 3),
        //                                   child:  Center(
        //                                     child: SvgPicture.asset(
        //                                       'images/sm/sm_call.svg',
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                               SizedBox(width: AppSize.s15),
        //                               Stack(
        //                                 children: [
        //                                   AppClickableWidget(
        //                                     onTap: () {},
        //                                     onHover: (bool val) {},
        //                                     child: Container(
        //                                       // padding: const EdgeInsets.symmetric(
        //                                       //     horizontal: 5, vertical: 3),
        //                                       child: const Center(
        //                                         child: Icon(
        //                                           Icons.notifications_none_outlined,
        //                                           color: Colors.white,
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   Positioned(
        //                                     top: 20,
        //                                     left: 30,
        //                                     child: CircleAvatar(
        //                                       radius: 10,
        //                                       backgroundColor:Colors.red,
        //                                       child: Center(child: Text('1')),
        //                                     ),
        //                                   )
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                         Expanded(
        //                           flex: 2,
        //                           child: Padding(
        //                             padding: const EdgeInsets.only(right:30),
        //                             child: Row(
        //                               mainAxisAlignment: MainAxisAlignment.end,
        //                               children: [
        //                                 Column(
        //                                   mainAxisAlignment: MainAxisAlignment.center,
        //
        //                                   children: [
        //                                     MouseRegion(
        //                                       onEnter: (_) {},
        //                                       onExit: (_) {
        //                                         // Handle mouse leave
        //                                       },
        //                                       child: FutureBuilder<UserAppBar>(
        //                                         future: getAppBarDetails(context),
        //                                         builder: (context, snapshot) {
        //                                           if (snapshot.connectionState == ConnectionState.waiting) {
        //                                             print("Future is loading...");
        //                                             return GestureDetector(
        //                                               child: CircleAvatar(
        //                                                 backgroundColor: Colors.grey[100],
        //                                                 radius: 13,
        //                                                 backgroundImage: AssetImage("images/profilepic.png"),
        //                                               ),
        //                                               onTap: () {
        //                                                 print("userid appbar (waiting state): ${snapshot.data?.userId}");
        //                                               },
        //                                             );
        //                                           } else if (snapshot.hasError || snapshot.data == null || snapshot.data!.imgUrl.isEmpty) {
        //                                             print("Error or empty imgUrl or snapshot data is null");
        //                                             return GestureDetector(
        //                                               child: CircleAvatar(
        //                                                 backgroundColor: Colors.grey[100],
        //                                                 radius: 13,
        //                                                 backgroundImage: AssetImage("images/profilepic.png"),
        //                                               ),
        //                                               onTap: () {
        //                                                 print("userid appbar (error or empty imgUrl): ${snapshot.data?.userId}");
        //                                               },
        //                                             );
        //                                           } else if (snapshot.hasData && snapshot.data!.imgUrl.isNotEmpty) {
        //                                             print("Data exists and imgUrl is not empty: ${snapshot.data!.imgUrl}");
        //                                             return GestureDetector(
        //                                               child: CircleAvatar(
        //                                                 backgroundColor: Colors.transparent,
        //                                                 radius: 13, // Adjust size as needed
        //                                                 backgroundImage: NetworkImage(snapshot.data!.imgUrl,),
        //
        //                                                 // child: ClipOval(
        //                                                 //   child: Image.network(
        //                                                 //     snapshot.data!.imgUrl,
        //                                                 //     fit: BoxFit.cover,
        //                                                 //     loadingBuilder: (context, child, loadingProgress) {
        //                                                 //       if (loadingProgress == null) {
        //                                                 //         print("Image loaded successfully");
        //                                                 //         return child; // When image has fully loaded
        //                                                 //       } else {
        //                                                 //         print("Image is loading...");
        //                                                 //         return Center(child: CircularProgressIndicator());
        //                                                 //       }
        //                                                 //     },
        //                                                 //     errorBuilder: (context, error, stackTrace) {
        //                                                 //       print("Error loading image, fallback to default");
        //                                                 //       // Fallback to default image if error occurs (invalid URL, etc.)
        //                                                 //       return Image.asset("images/profilepic.png", fit: BoxFit.cover);
        //                                                 //     },
        //                                                 //   ),
        //                                                 // ),
        //                                               ),
        //                                               onTap: () {
        //                                                 print("userid appbar (network image): ${snapshot.data?.userId}");
        //                                               },
        //                                             );
        //                                           } else {
        //                                             print("No data or image URL empty, fallback to default");
        //                                             return GestureDetector(
        //                                               child: CircleAvatar(
        //                                                 backgroundColor: Colors.grey[100],
        //                                                 radius: 13,
        //                                                 backgroundImage: AssetImage("images/profilepic.png"),
        //                                               ),
        //                                               onTap: () {},
        //                                             );
        //                                           }
        //                                         },
        //                                       ),
        //                                     ),
        //                                     const SizedBox(height: AppSize.s5),
        //                                     FutureBuilder(
        //                                       future: user(),
        //                                       builder: (context, snap) {
        //                                         if (snap.connectionState == ConnectionState.waiting) {
        //                                           print("User data is loading...");
        //                                           return SizedBox();
        //                                         }
        //
        //                                         return MouseRegion(
        //                                           onEnter: (_) {
        //                                             // Show logout popup when hovering over username
        //                                             print("Showing logout menu...");
        //                                             showMenu(
        //                                               context: context,
        //                                               position: RelativeRect.fromLTRB(
        //                                                   70,
        //                                                   70,
        //                                                   0,
        //                                                   0), // Adjust position as needed
        //                                               items: [
        //                                                 PopupMenuItem(
        //                                                   padding: EdgeInsets.zero,
        //                                                   height: 30,
        //                                                   child: GestureDetector(
        //                                                     onTap: () {
        //                                                       if (isLoggedIn) {
        //                                                         print("Logging out...");
        //                                                         // Handle logout
        //                                                         showDialog(
        //                                                           context: context,
        //                                                           builder: (context) => DeletePopup(
        //                                                             onCancel: () {
        //                                                               Navigator.pop(context);
        //                                                             },
        //                                                             onDelete: () {
        //                                                               TokenManager.removeAccessToken();
        //                                                               Navigator.pushNamedAndRemoveUntil(
        //                                                                 context,
        //                                                                 LoginScreen.routeName,
        //                                                                     (route) => false,
        //                                                               );
        //                                                             },
        //                                                             btnText: "Log Out",
        //                                                             title: "Log Out",
        //                                                             text: "Do you really want to logout?",
        //                                                           ),
        //                                                         );
        //                                                       }
        //                                                     },
        //                                                     child: Container(
        //                                                       height: 25,
        //                                                       width: 90,
        //                                                       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        //                                                       child: Row(
        //                                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                                                         crossAxisAlignment: CrossAxisAlignment.center,
        //                                                         children: [
        //                                                           Icon(
        //                                                             Icons.logout,
        //                                                             size: 12,
        //                                                             color: Colors.black,
        //                                                           ),
        //                                                           Text(
        //                                                             'Log Out',
        //                                                             style: TextStyle(
        //                                                               fontSize: 12,
        //                                                               color: Colors.black,
        //                                                               fontWeight: FontWeight.w600,
        //                                                             ),
        //                                                           ),
        //                                                         ],
        //                                                       ),
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                               ],
        //                                             );
        //                                           },
        //                                           child: Text(
        //                                             loginName!,
        //                                             textAlign: TextAlign.center,
        //                                             style: TextStyle(
        //                                               color: Colors.white,
        //                                               fontSize: 8, // Adjust font size as needed
        //                                               fontWeight: FontWeight.w400,
        //                                             ),
        //                                           ),
        //                                         );
        //                                       },
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),

                          //     ],
                          //   ),
                          // )
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}







class UserAppBarWidget extends StatefulWidget {
  const UserAppBarWidget({Key? key}) : super(key: key);

  @override
  State<UserAppBarWidget> createState() => _UserAppBarWidgetState();
}

class _UserAppBarWidgetState extends State<UserAppBarWidget> {
  // late final Future<UserAppBar> _appBarFuture;
  // late final Future<UserModel> _userFuture; // Replace `UserDataType` with the correct return type of `user()`

  @override
  void initState() {
    super.initState();
    // _appBarFuture = getAppBarDetails(context);
    // _userFuture = user();
  }

  String? loginName = '';
  String? loginEmail = '';
  //int loginUserId = 0;
  bool isLoggedIn = true;
  Future<String> user() async {
    loginName = await TokenManager.getUserName();
    //loginName = userName;
    print("UserName login ${loginName}");
    return loginName!;
  }
  Future<String> email() async {
    loginEmail = await TokenManager.getEmail();
    //loginName = userName;
    print("loginEmail login ${loginEmail}");
    return loginEmail!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 5),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar (non-tappable)
          FutureBuilder<UserAppBar>(
            future: getAppBarDetails(context),
            builder: (context, snapshot) {
              Widget avatar = CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 20,
                backgroundImage: const AssetImage("images/profilepic.png"),
              );

              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data!.imgUrl.isNotEmpty) {
                avatar = CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 20,
                  backgroundImage: NetworkImage(snapshot.data!.imgUrl),
                );
              }

              return avatar; // purely visual
            },
          ),
          const SizedBox(width: 3),

          // Login name and dropdown icon
          FutureBuilder(
            future: user(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              }

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        loginName ?? "",
                        style: const TextStyle(
                          color: Color(0xFF2EA3D4),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  // Flexible(
                  //   child: Text(
                  //     loginName ?? "",
                  //     style: const TextStyle(
                  //       color: Color(0xFF2EA3D4),
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w700,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(width: 4),

                  // Custom styled popup menu with icons
                  Theme(
                    data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              ),
                    child: PopupMenuButton<String>(
                      tooltip: '',
                      splashRadius: 0,
                      color: Colors.white,
                      offset: const Offset(0, 40),
                      padding: EdgeInsets.zero,
                      
                      itemBuilder: (BuildContext context) => [
                        // Settings
                        PopupMenuItem<String>(
                          height: 25,
                          value: 'Settings',
                          padding: EdgeInsets.zero,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                             // Navigator.pop(context);
                              // Navigate or perform settings logic
                            },
                            child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 12,),
                                  width: 120,
                                  height: 40,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 5.5),
                                      Row(
                                        children: [
                                           Icon(Icons.settings, size: 18, color: ColorManager.mediumgrey),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Settings',
                                            style: CustomTextStylesCommon.commonStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: FontSize.s12,
                                              color: ColorManager.mediumgrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                ),
                    
                          ),
                        ),
                    
                        // Divider
                      //  const PopupMenuDivider(),
                    
                        // Notification
                        PopupMenuItem<String>(
                          height: 25,
                          value: 'Notification',
                          padding: EdgeInsets.zero,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                            //  Navigator.pop(context);
                              // Notification logic
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 12, ),
                              width: 120,
                              height: 40,
                              child: Column(
                                children: [
                                  const SizedBox(height: 5.5),
                                  Row(
                                    children: [
                                       Icon(Icons.notifications_rounded, size: 18, color: ColorManager.mediumgrey),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Notification',
                                        style: CustomTextStylesCommon.commonStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: FontSize.s12,
                                          color: ColorManager.mediumgrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                          ),
                        ),
                    
                        // Divider
                       // const PopupMenuDivider(),
                    
                        // Log Out
                        PopupMenuItem<String>(
                          height: 25,
                          value: 'Logout',
                          padding: EdgeInsets.zero,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);
                              if (isLoggedIn) {
                                showDialog(
                                  context: context,
                                  builder: (context) => DeletePopup(
                                    onCancel: () => Navigator.pop(context),
                                    onDelete: () {
                                      TokenManager.removeAccessToken();
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        LoginScreen.routeName,
                                            (route) => false,
                                      );
                                    },
                                    btnText: "Log Out",
                                    title: "Log Out",
                                    text: "Do you really want to logout?",
                                  ),
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 12, ),
                              width: 120,
                              height: 40,
                              child: Column(
                                children: [
                                  const SizedBox(height: 5.5),
                                  Row(
                                    children: [
                                       Icon(Icons.logout, size: 18, color: ColorManager.mediumgrey),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Log Out',
                                        style: CustomTextStylesCommon.commonStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: FontSize.s12,
                                          color: ColorManager.mediumgrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                          ),
                        ),
                     //   const PopupMenuDivider(),
                      ],
                      child: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Color(0xFF2EA3D4),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),


      ///
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     MouseRegion(
      //       onEnter: (_) {},
      //       onExit: (_) {},
      //       child: FutureBuilder<UserAppBar>(
      //         future: getAppBarDetails(context),
      //         builder: (context, snapshot) {
      //           Widget avatar = CircleAvatar(
      //             backgroundColor: Colors.grey[100],
      //             radius: 20,
      //             backgroundImage: const AssetImage("images/profilepic.png"),
      //           );
      //
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return GestureDetector(child: avatar, onTap: () {});
      //           } else if (snapshot.hasData && snapshot.data!.imgUrl.isNotEmpty) {
      //             avatar = CircleAvatar(
      //               backgroundColor: Colors.transparent,
      //               radius: 20,
      //               backgroundImage: NetworkImage(snapshot.data!.imgUrl),
      //             );
      //           }
      //
      //           return GestureDetector(
      //             child: avatar,
      //             onTap: () {
      //               print("userid appbar: ${snapshot.data?.userId}");
      //             },
      //           );
      //         },
      //       ),
      //     ),
      //     const SizedBox(width: 3),
      //     FutureBuilder(
      //       future: user(),
      //       builder: (context, snap) {
      //         if (snap.connectionState == ConnectionState.waiting) {
      //           return const SizedBox();
      //         }
      //
      //         return MouseRegion(
      //           onEnter: (_) {
      //             showMenu(
      //               context: context,
      //               position: const RelativeRect.fromLTRB(70, 70, 0, 0),
      //               items: [
      //                 // PopupMenuItem(
      //                 //   padding: EdgeInsets.zero,
      //                 //   height: 30,
      //                 //   child: GestureDetector(
      //                 //     onTap: () {
      //                 //       if (isLoggedIn) {
      //                 //         showDialog(
      //                 //           context: context,
      //                 //           builder: (context) => DeletePopup(
      //                 //             onCancel: () => Navigator.pop(context),
      //                 //             onDelete: () {
      //                 //               TokenManager.removeAccessToken();
      //                 //               Navigator.pushNamedAndRemoveUntil(
      //                 //                 context,
      //                 //                 LoginScreen.routeName,
      //                 //                     (route) => false,
      //                 //               );
      //                 //             },
      //                 //             btnText: "Log Out",
      //                 //             title: "Log Out",
      //                 //             text: "Do you really want to logout?",
      //                 //           ),
      //                 //         );
      //                 //       }
      //                 //     },
      //                 //     child: Container(
      //                 //       height: 25,
      //                 //       width: 90,
      //                 //       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      //                 //       child: Row(
      //                 //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 //         crossAxisAlignment: CrossAxisAlignment.center,
      //                 //         children: const [
      //                 //           Icon(Icons.logout, size: 12, color: Colors.black),
      //                 //           Text(
      //                 //             'Log Out',
      //                 //             style: TextStyle(
      //                 //               fontSize: 12,
      //                 //               color: Colors.black,
      //                 //               fontWeight: FontWeight.w600,
      //                 //             ),
      //                 //           ),
      //                 //         ],
      //                 //       ),
      //                 //     ),
      //                 //   ),
      //                 // ),
      //                 ///
      //                 ///
      //                 PopupMenuItem(
      //                   padding: EdgeInsets.zero,
      //                   height: 30,
      //                   child: GestureDetector(
      //                     onTap: () {
      //                       // Add your navigation or action here
      //                      // Navigator.pushNamed(context, '/profile'); // Example
      //                     },
      //                     child: Container(
      //                       height: 30,
      //                       width: 90,
      //                       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: const [
      //                           Icon(Icons.notifications_rounded, size: 12, color: Colors.black),
      //                           Text(
      //                             'Notification',
      //                             style: TextStyle(
      //                               fontSize: 12,
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.w600,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //
      //                 // Settings item
      //                 PopupMenuItem(
      //                   padding: EdgeInsets.zero,
      //                   height: 30,
      //                   child: GestureDetector(
      //                     onTap: () {
      //                       // Add your navigation or action here
      //                      // Navigator.pushNamed(context, '/settings'); // Example
      //                     },
      //                     child: Container(
      //                       height: 25,
      //                       width: 90,
      //                       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: const [
      //                           Icon(Icons.settings, size: 12, color: Colors.black),
      //                           Text(
      //                             'Settings',
      //                             style: TextStyle(
      //                               fontSize: 12,
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.w600,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //
      //                 // Log Out item
      //                 PopupMenuItem(
      //                   padding: EdgeInsets.zero,
      //                   height: 30,
      //                   child: GestureDetector(
      //                     onTap: () {
      //                       if (isLoggedIn) {
      //                         showDialog(
      //                           context: context,
      //                           builder: (context) => DeletePopup(
      //                             onCancel: () => Navigator.pop(context),
      //                             onDelete: () {
      //                               TokenManager.removeAccessToken();
      //                               Navigator.pushNamedAndRemoveUntil(
      //                                 context,
      //                                 LoginScreen.routeName,
      //                                     (route) => false,
      //                               );
      //                             },
      //                             btnText: "Log Out",
      //                             title: "Log Out",
      //                             text: "Do you really want to logout?",
      //                           ),
      //                         );
      //                       }
      //                     },
      //                     child: Container(
      //                       height: 25,
      //                       width: 90,
      //                       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: const [
      //                           Icon(Icons.logout, size: 12, color: Colors.black),
      //                           Text(
      //                             'Log Out',
      //                             style: TextStyle(
      //                               fontSize: 12,
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.w600,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             );
      //           },
      //           child: Row(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Text(
      //                 loginName ?? "",
      //                 style: TextStyle(
      //                   color: Color(0xFF2EA3D4),
      //                   fontSize: 13,
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               ),
      //               const SizedBox(width: 4),
      //               Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xFF2EA3D4)),
      //             ],
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
