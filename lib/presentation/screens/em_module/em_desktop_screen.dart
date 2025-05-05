import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/common_resources/common_theme_const.dart';
import 'package:prohealth/app/resources/establishment_resources/em_dashboard_string_manager.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/provider/em_provider/em_main_provider.dart';
import 'package:prohealth/app/resources/provider/navigation_provider.dart';
import 'package:prohealth/app/resources/screen_route_name.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_tab_widget/company_identity.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_employee_documents/manage_emp_doc.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/manage_work_schedule.dart';
import 'package:prohealth/presentation/screens/em_module/see_all_screen/see_all_provider.dart';
import 'package:prohealth/presentation/screens/em_module/see_all_screen/see_all_screen.dart';
import 'package:prohealth/presentation/screens/em_module/dashboard/dashboard_main_button_screen.dart';
import 'package:provider/provider.dart';
import '../../../app/services/api/managers/establishment_manager/company_identrity_manager.dart';
import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/widgets/const_appbar/controller.dart';
import '../hr_module/manage/widgets/bottom_row.dart';
import '../hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'company_identity/widgets/ci_tab_widget/ci_org_document.dart';
import 'company_identity/widgets/ci_tab_widget/ci_role_manager.dart';
import 'company_identity/widgets/ci_tab_widget/ci_visit.dart';
import 'manage_hr/hr_screen.dart';
import 'manage_hr/manage_pay_rates/finance_screen.dart';

class EMDesktopScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final EMController smController = Get.put(EMController());
  final String? dropdownValue;
  final ValueChanged<String?>? onChanged;
  final HRController hrController = Get.put(HRController());
  final VoidCallback? onItem2Selected;
  //String selectedOption = 'Select ';
  bool showSelectOption = true;
  final ButtonSelectionController myController = Get.put(ButtonSelectionController());

  EMDesktopScreen({
    this.dropdownValue,
    this.onChanged,
    this.onItem2Selected,
  });
  // void navigateToPage2() {
  //   if (_pageController.page != 3) {
  //     _pageController.animateToPage(
  //       3,
  //       duration: Duration(milliseconds: 500),
  //       curve: Curves.ease,
  //     );
  //   }
  // }
  void navigateToPage(BuildContext context, String routeName) {
    Provider.of<RouteProvider>(
        context,
        listen: false)
        .setRoute(
        routeName);
    //Navigator.pushNamed(context, routeName);
    switch (routeName) {
      case RouteStrings.emCompanyIdentity:
        _pageController.animateToPage(1,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease);
        break;
      // case RoutesManager.companyIdentityRoute:
      //   _pageController.jumpToPage(1);
      //   break;
      default:
        break;
    }
  }
  int pgeControllerId = 0;
  Future<bool> _onWillPop() async {
    if (pgeControllerId == 0) {
      _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
      // return false; // Prevent the default back navigation
    }else if(pgeControllerId == 1){
      myController.selectButton(0);
      _pageController.animateToPage(0,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
      return false;
    }else if(pgeControllerId == 6){
      myController.selectButton(1);
      _pageController.animateToPage(1,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
      return false;
    }
    return true; // Allow the back navigation to exit the app
  }
  var selectedItem =  EmDashboardStringManager.selectModule;
  //final int companyId = await TokenManager.getCompanyId();
  @override
  Widget build(BuildContext context) {
    // RoutesManager routesManager = RoutesManager();
    return Consumer<EmMainProvider>(
      builder: (context,providerEmState,child) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
              Column(
                children: [
                  const ApplicationAppBar(headingText: EmDashboardStringManager.em),
                  ///2nd  buttons
                  Container(
                    margin: const EdgeInsets.only(
                        top: AppPadding.p20,bottom: AppPadding.p20, right: AppPadding.p20,left: AppPadding.p20,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => CustomTitleButton(
                                height: AppSize.s30,
                                width: AppSize.s100,
                                onPressed: () {
                                  myController.selectButton(0);
                                  _pageController.animateToPage(0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                  providerEmState.selectModuleScreen(0);
                                  providerEmState.selectModuleNameScreen("Select a Module");
                                  pgeControllerId = 0;
                                },
                                text: EmDashboardStringManager.dashboard,
                                isSelected: myController.selectedIndex.value == 0,
                              ),
                            ),
                            SizedBox(
                              width: AppSize.s10,
                            ),
                            Obx(
                              () => CustomTitleButton(
                                height: AppSize.s30,
                                width: AppSize.s140,
                                onPressed: () {
                                  // uploadCompanyLogoApi(context, 5, "employ");
                                  companyByIdApi(
                                    context,
                                  );
                                  myController.selectButton(1);
                                  _pageController.animateToPage(1, duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                  providerEmState.selectModuleScreen(1);
                                  providerEmState.selectModuleNameScreen("Select a Module");
                                  pgeControllerId = 1;
                                },
                                text: EmDashboardStringManager.companyIdentity,
                                isSelected: myController.selectedIndex.value == 1,
                              ),
                            ),
                            SizedBox(width: AppSize.s15,),
                            Material(
                                elevation: 4,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                child: CustomDropdownButton(
                                  height: AppSize.s30,
                                  width: AppSize.s170,
                                  initialItem: providerEmState.pageNmaeValue,
                                  items: [
                                    DropdownItem(title: "User Management", isHeading: true),
                                    DropdownItem(title: "Users", index: 2),
                                    DropdownItem(title: "Role Manager", index: 3),

                                    DropdownItem(title: "Clinical", isHeading: true),
                                    DropdownItem(title: "Visits", index: 4),

                                    DropdownItem(title: "HR", isHeading: true),
                                    DropdownItem(title: "Designation Settings", index: 5),
                                    DropdownItem(title: "Work Schedule", index: 6),
                                    DropdownItem(title: "Employee Documents", index: 7),

                                    DropdownItem(title: "Finance", isHeading: true),
                                    DropdownItem(title: "Pay Rate", index: 8),

                                    DropdownItem(title: "Org Document", isHeading: true),
                                    DropdownItem(title: "Document Definition", index: 9),
                                  ],
                                  onItemSelected: (selectedValue, pageIndex) {
                                    myController.selectButton(pageIndex);
                                    _pageController.animateToPage(
                                      pageIndex,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                    providerEmState.selectModuleScreen(pageIndex);
                                    providerEmState.selectModuleNameScreen(selectedValue);
                                    print('Page index ${pageIndex}');
                                    print('Page Value ${selectedValue}');
                                  },
                                )
                              ),
                            SizedBox(width: AppSize.s15,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: PageView(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children:
                      [
                        DashboardMainButtonScreen(),
                        CompanyIdentity(),
                        ChangeNotifierProvider(
                          create: (_) => SeeAllProvider(),
                          child: SeeAllScreen(),
                        ),
                        CiRoleManager(),
                        CiVisitScreen(),
                        ChangeNotifierProvider(
                            create: (_) => HrScreenProvider(),
                            child: HrScreen()),
                        ChangeNotifierProvider(
                            create: (_) => WorkScheduleProvider(),
                            child: WorkSchedule()),
                        ChangeNotifierProvider(
                            create: (_) => ManageEmployDocumentProvider(),
                            child: ManageEmployDocument()),
                        ChangeNotifierProvider(
                            create: (_) => FinanceProvider(),
                            child: FinanceScreen()),
                        CiOrgDocument(),
                      ],
                                  ),
                  ),
                  BottomBarRow()
                ],
              ),
            ]),
          ),
        );
      }
    );
  }
}

class EMController extends GetxController {
  var selectedItem = 'Admin'.obs;
  void changeSelectedItem(String newItem) {
    selectedItem.value = newItem;
  }
}

class ButtonSelectionController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void selectButton(int index) {
    selectedIndex.value = index;
  }
}

class CustomDropdownButton extends StatefulWidget {
  final double height;
  final double width;
  final  List<DropdownItem> items;
  final void Function(String, int)? onItemSelected;
  String initialItem;

   CustomDropdownButton({
    required this.height,
    required this.width,
    required this.items,
    required this.initialItem,
    this.onItemSelected,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialItem; // Initialize with initialItem
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeDropdown();
    } else {
      _showDropdown();
    }
  }
  // void _showDropdown() {
  //   final RenderBox renderBox = context.findRenderObject() as RenderBox;
  //   final Offset offset = renderBox.localToGlobal(Offset.zero);
  //   final double buttonHeight = renderBox.size.height;
  //   final double buttonWidth = renderBox.size.width;
  //
  //   _overlayEntry = OverlayEntry(
  //     builder: (context) => Positioned(
  //       width: buttonWidth,
  //       left: offset.dx,
  //       top: offset.dy + buttonHeight,
  //       child: CompositedTransformFollower(
  //         link: _layerLink,
  //         offset: Offset(0, buttonHeight),
  //         child: Padding(
  //           padding: const EdgeInsets.only(top: 4.0),
  //           child: Material(
  //             elevation: 4,
  //             borderRadius: BorderRadius.circular(12),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: widget.items.map((item) {
  //                   return InkWell(
  //                     onTap: () {
  //                       if (!item.isHeading) {
  //                         setState(() {
  //                           _selectedItem = item.title;
  //                         });
  //                         int itemIndex = widget.items
  //                             .where((element) => !element.isHeading)
  //                             .toList()
  //                             .indexOf(item) + 2;
  //                         widget.onItemSelected?.call(item.title, itemIndex);
  //                         _removeDropdown();
  //                       }
  //                     },
  //                     child: Container(
  //                       padding: item.isHeading
  //                           ? EdgeInsets.symmetric(horizontal: 16, vertical: 8)
  //                           : EdgeInsets.only(top: 8, bottom: 8, left: 30),
  //                       width: double.infinity, // Makes entire row clickable
  //                       child: Text(
  //                         item.title,
  //                         style: TextStyle(
  //                           fontSize: FontSize.s14,
  //                           fontWeight: item.isHeading ? FontWeight.w700 : FontWeight.w500,
  //                           color: item.isHeading ? ColorManager.black : ColorManager.textPrimaryColor,
  //                           decoration: TextDecoration.none,
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 }).toList(),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  //
  //   Overlay.of(context).insert(_overlayEntry!);
  //   setState(() {
  //     _isDropdownOpen = true;
  //   });
  // }
  //
  void _showDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final double buttonHeight = renderBox.size.height;
    final double buttonWidth = renderBox.size.width;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Detect taps outside the dropdown to close it
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _removeDropdown,
            child: Container(
              color: Colors.transparent, // Ensures taps are detected
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            width: buttonWidth,
            left: offset.dx,
            top: offset.dy + buttonHeight,
            child: CompositedTransformFollower(
              link: _layerLink,
              offset: Offset(0, buttonHeight),
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.items.map((item) {
                        return InkWell(
                          onTap: () {
                            if (!item.isHeading) {
                              setState(() {
                                _selectedItem = item.title;
                              });
                              int itemIndex = widget.items
                                  .where((element) => !element.isHeading)
                                  .toList()
                                  .indexOf(item) + 2;
                              widget.onItemSelected?.call(item.title, itemIndex);
                              _removeDropdown();
                            }
                          },
                          child: Container(
                            padding: item.isHeading
                                ? EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                                : EdgeInsets.only(top: 8, bottom: 8, left: 30),
                            width: double.infinity,
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: FontSize.s14,
                                fontWeight: item.isHeading ? FontWeight.w700 : FontWeight.w500,
                                color: item.isHeading ? ColorManager.black : ColorManager.textPrimaryColor,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }


  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: widget.height + 5,
          decoration: widget.initialItem != EmDashboardStringManager.selectModule
              ? BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff51B5E6),
                  Color(0xff008ABD),
                ],
              ))
              : const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.initialItem,
                style: TextStyle(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w700,
                  color: widget.initialItem == EmDashboardStringManager.selectModule
                      ? ColorManager.textPrimaryColor
                      :  Colors.white),
                ),
              Icon(Icons.arrow_drop_down, color: widget.initialItem == EmDashboardStringManager.selectModule
                  ? ColorManager.textPrimaryColor
                  :  Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownItem {
  final String title;
  final bool isHeading;
  final int? index;

  DropdownItem({required this.title, this.isHeading = false, this.index});
}
