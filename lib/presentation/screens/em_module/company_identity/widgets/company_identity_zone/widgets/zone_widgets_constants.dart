// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../../../../app/resources/color.dart';
// import '../../../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
// import '../../../../../../../app/resources/font_manager.dart';
// import '../../../../../../../app/resources/value_manager.dart';
// import '../../../../widgets/button_constant.dart';
// import '../../../../widgets/text_form_field_const.dart';
// import '../../whitelabelling/success_popup.dart';
//
// class CIZoneAddPopup extends StatefulWidget {
//   final TextEditingController countynameController;
//   final TextEditingController zipcodeController;
//   final TextEditingController? mapController;
//   final TextEditingController? landmarkController;
//   final TextEditingController? zoneController;
//   final TextEditingController? cityController;
//   final TextEditingController? countryController;
//   final TextEditingController? stateController;
//   final Future<void> Function() onSavePressed;
//   final String title1;
//   final String title2;
//   final String? title3;
//   final String? title4;
//   final String? title5;
//   final String? title6;
//   final String title;
//
//   const CIZoneAddPopup({
//     Key? key,
//     required this.onSavePressed,
//     required this.title1,
//     required this.title2,
//     this.title3,
//     this.title4,
//     this.title5,
//     this.title6,
//     required this.countynameController,
//     required this.zipcodeController,
//     this.mapController,
//     this.landmarkController,
//     this.zoneController,
//     this.cityController,
//     this.countryController,
//     this.stateController,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   State<CIZoneAddPopup> createState() => _CIZoneAddPopupState();
// }
//
// class _CIZoneAddPopupState extends State<CIZoneAddPopup> {
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: SingleChildScrollView(
//         child: Container(
//           width: AppSize.s400,
//           height: AppSize.s350,
//           decoration: BoxDecoration(
//             color: ColorManager.white,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: ColorManager.bluebottom,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     topRight: Radius.circular(8),
//                   ),
//                 ),
//                 height: 40,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       child: Text(
//                         widget.title,
//                         style: GoogleFonts.firaSans(
//                           fontSize: FontSize.s12,
//                           fontWeight: FontWeightManager.semiBold,
//                           color: ColorManager.white,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(
//                         Icons.close,
//                         color: ColorManager.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: AppSize.s20,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: AppPadding.p6,
//                   horizontal: AppPadding.p20,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SMTextFConst(
//                       controller: widget.countynameController,
//                       keyboardType: TextInputType.text,
//                       text: widget.title1,
//                     ),
//                     SizedBox(height: AppSize.s20),
//                     SMTextFConst(
//                       controller: widget.zipcodeController,
//                       keyboardType: TextInputType.text,
//                       text: widget.title2,
//                     ),
//                     if (widget.title3 != null) ...[
//                       SizedBox(height: AppSize.s20),
//                       SMTextFConst(
//                         controller: widget.mapController!,
//                         keyboardType: TextInputType.text,
//                         text: widget.title3!,
//                       ),
//                     ],
//                     if (widget.title4 != null &&
//                         widget.landmarkController != null) ...[
//                       SizedBox(height: AppSize.s20),
//                       SMTextFConst(
//                         controller: widget.landmarkController!,
//                         keyboardType: TextInputType.text,
//                         text: widget.title4!,
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//               SizedBox(height: AppSize.s30,),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: AppPadding.p24, top: AppPadding.p14),
//                 child: isLoading
//                     ? SizedBox(
//                     height: 25,width: 25,
//                     child: CircularProgressIndicator( color: ColorManager.blueprime,))
//                     : Center(
//                   child: CustomElevatedButton(
//                     width: AppSize.s105,
//                     height: AppSize.s30,
//                     text: AppStringEM.save,
//                     onPressed: () async {
//                       setState(() {
//                         isLoading = true;
//                       });
//                      await widget.onSavePressed();
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return CountySuccessPopup(message: 'Save Successfully',);
//                         },
//                       );
//                       setState(() {
//                         isLoading = false;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// ///edit
// class AddZipCodePopup extends StatefulWidget {
//   final String title;
//   final TextEditingController countynameController;
//   final TextEditingController zipcodeController;
//   final TextEditingController mapController;
//   final TextEditingController cityNameController;
//   final TextEditingController landmarkController;
//   final Widget? child;
//   final Widget? child1;
//   final Future<void> Function() onSavePressed;
//    const AddZipCodePopup({super.key, required this.title, required this.countynameController, required this.zipcodeController, required this.mapController, required this.landmarkController, this.child, required this.onSavePressed, required this.cityNameController, this.child1,});
//
//   @override
//   State<AddZipCodePopup> createState() => _AddZipCodePopupState();
// }
//
// class _AddZipCodePopupState extends State<AddZipCodePopup> {
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: SingleChildScrollView(
//         child: Container(
//           width: AppSize.s400,
//           height: AppSize.s460,
//           decoration: BoxDecoration(
//             color: ColorManager.white,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: ColorManager.bluebottom,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     topRight: Radius.circular(8),
//                   ),
//                 ),
//                 height: 40,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       child: Text(
//                         widget.title,
//                         style: GoogleFonts.firaSans(
//                           fontSize: FontSize.s12,
//                           fontWeight: FontWeightManager.semiBold,
//                           color: ColorManager.white,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(
//                         Icons.close,
//                         color: ColorManager.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: AppPadding.p3,
//                   horizontal: AppPadding.p20,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Zone',
//                           style: GoogleFonts.firaSans(
//                             fontSize: FontSize.s12,
//                             fontWeight: FontWeight.w700,
//                             color: ColorManager.mediumgrey,
//                             //decoration: TextDecoration.none,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         widget.child!
//                       ],
//                     ),
//                     SizedBox(height: AppSize.s10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'County Name',
//                           style: GoogleFonts.firaSans(
//                             fontSize: FontSize.s12,
//                             fontWeight: FontWeight.w700,
//                             color: ColorManager.mediumgrey,
//                             //decoration: TextDecoration.none,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         widget.child1!
//                       ],
//                     ),
//                     SizedBox(height: AppSize.s10),
//                     SMTextFConst(
//                       controller: widget.cityNameController,
//                       keyboardType: TextInputType.text,
//                       text: 'City Name',
//                     ),
//                       SizedBox(height: AppSize.s10),
//                       SMTextFConst(
//                         controller: widget.zipcodeController,
//                         keyboardType: TextInputType.text,
//                         text: 'Zip Code',
//                       ),
//                       SizedBox(height: AppSize.s10),
//                       SMTextFConst(
//                         controller: widget.landmarkController!,
//                         keyboardType: TextInputType.text,
//                         text: 'Landmark',
//                       ),
//
//                   ],
//                 ),
//               ),
//               SizedBox(height: AppSize.s10,),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: AppPadding.p24, top: AppPadding.p14),
//                 child: isLoading
//                     ? SizedBox(
//                     height: 25,width: 25,
//                     child: CircularProgressIndicator( color: ColorManager.blueprime,))
//                     : Center(
//                   child: CustomElevatedButton(
//                     width: AppSize.s105,
//                     height: AppSize.s30,
//                     text: AppStringEM.save,
//                     onPressed: () async {
//                       setState(() {
//                         isLoading = true;
//                       });
//                       await widget.onSavePressed();
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return CountySuccessPopup(message: 'Save Successfully',);
//                         },
//                       );
//                       setState(() {
//                         isLoading = false;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/resources/value_manager.dart';
import '../../../../widgets/button_constant.dart';
import '../../../../widgets/text_form_field_const.dart';
import '../../whitelabelling/success_popup.dart';
import 'package:flutter/material.dart';


class CIZoneAddPopup extends StatefulWidget {
  final TextEditingController countynameController;
  final TextEditingController zipcodeController;
  final TextEditingController? mapController;
  final TextEditingController? landmarkController;
  final TextEditingController? zoneController;
  final TextEditingController? cityController;
  final TextEditingController? countryController;
  final TextEditingController? stateController;
  final Future<void> Function() onSavePressed;
  final String title1;
  final String title2;
  final String? title3;
  final String? title4;
  final String? title5;
  final String? title6;
  final String title;

  const CIZoneAddPopup({
    Key? key,
    required this.onSavePressed,
    required this.title1,
    required this.title2,
    this.title3,
    this.title4,
    this.title5,
    this.title6,

    required this.countynameController,
    required this.zipcodeController,
    this.mapController,
    this.landmarkController,
    this.zoneController,
    this.cityController,
    this.countryController,
    this.stateController,
    required this.title,
  }) : super(key: key);

  @override
  State<CIZoneAddPopup> createState() => _CIZoneAddPopupState();
}

class _CIZoneAddPopupState extends State<CIZoneAddPopup> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: AppSize.s407,
          height: AppSize.s350,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.bluebottom,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.semiBold,
                          color: ColorManager.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: ColorManager.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.s20,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p6,
                  horizontal: AppPadding.p20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SMTextFConst(
                      controller: widget.countynameController,
                      keyboardType: TextInputType.text,
                      text: widget.title1,
                    ),
                    SizedBox(height: AppSize.s20),
                    SMTextFConst(
                      controller: widget.zipcodeController,
                      keyboardType: TextInputType.text,
                      text: widget.title2,
                    ),
                    if (widget.title3 != null) ...[
                      SizedBox(height: AppSize.s20),
                      SMTextFConst(
                        controller: widget.mapController!,
                        keyboardType: TextInputType.text,
                        text: widget.title3!,
                      ),
                    ],
                    if (widget.title4 != null &&
                        widget.landmarkController != null) ...[
                      SizedBox(height: AppSize.s20),
                      SMTextFConst(
                        controller: widget.landmarkController!,
                        keyboardType: TextInputType.text,
                        text: widget.title4!,
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(height: AppSize.s5),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: AppPadding.p24, top: AppPadding.p14),
                child: isLoading
                    ? SizedBox(
                    height: AppSize.s25,
                    width: AppSize.s25,
                    child: CircularProgressIndicator( color: ColorManager.blueprime,))
                    : Center(
                  child: CustomElevatedButton(
                    width: AppSize.s105,
                    height: AppSize.s30,
                    text: AppStringEM.save,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await widget.onSavePressed();
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CountySuccessPopup(message: 'Save Successfully',);
                        },
                      );
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///edit
class AddZipCodePopup extends StatefulWidget {
  final String title;
  final TextEditingController countynameController;
  final TextEditingController zipcodeController;
  final TextEditingController mapController;
  final TextEditingController cityNameController;
  final TextEditingController landmarkController;
  final Widget? child;
  final Widget? child1;
  final Future<void> Function() onSavePressed;
  const AddZipCodePopup({super.key, required this.title, required this.countynameController, required this.zipcodeController, required this.mapController, required this.landmarkController, this.child, required this.onSavePressed, required this.cityNameController, this.child1,});

  @override
  State<AddZipCodePopup> createState() => _AddZipCodePopupState();
}

class _AddZipCodePopupState extends State<AddZipCodePopup> {
  LatLng? _selectedLocation= LatLng(37.7749, -122.4194);

  // void _pickLocation() async {
  //   final pickedLocation = await Navigator.of(context).push<LatLng>(
  //     MaterialPageRoute(
  //       builder: (context) => PickLocationScreen(
  //         initialLocation: _selectedLocation!,
  //         onLocationPicked: (location) {
  //           setState(() {
  //             _selectedLocation = location;
  //           });
  //         },
  //       ),
  //     ),
  //   );
  //   // if (pickedLocation != null) {
  //   //   setState(() {
  //   //     _selectedLocation = pickedLocation;
  //   //   });
  //
  //
  //     // Use _selectedLocation.latitude and _selectedLocation.longitude as needed
  //     print('Selected Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}');
  //   }

  void _pickLocation() async {
    final pickedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        builder: (context) => PickLocationScreen(
          initialLocation: _selectedLocation!,
          onLocationPicked: (location) {
            setState(() {
              _selectedLocation = location;
            });
          },
        ),
      ),
    );

    if (pickedLocation != null) {
      setState(() {
        _selectedLocation = pickedLocation;
        // Update the mapController text field with the new location
        widget.mapController.text =
        '${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}';
      });
    }
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: AppSize.s400,
          height: AppSize.s460,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.bluebottom,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                height: AppSize.s40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.semiBold,
                          color: ColorManager.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: ColorManager.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p3,
                  horizontal: AppPadding.p20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.zone,
                          style: GoogleFonts.firaSans(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.bold,
                            color: ColorManager.mediumgrey,
                            //decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: AppSize.s5),
                        widget.child!
                      ],
                    ),
                    SizedBox(height: AppSize.s10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'County Name',
                          style: GoogleFonts.firaSans(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.bold,
                            color: ColorManager.mediumgrey,
                            //decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: AppSize.s5),
                        widget.child1!
                      ],
                    ),
                    SizedBox(height: AppSize.s10),
                    SMTextFConst(
                      controller: widget.cityNameController,
                      keyboardType: TextInputType.text,
                      text: 'City Name',
                    ),
                    SizedBox(height: AppSize.s10),
                    SMTextFConst(
                      controller: widget.zipcodeController,
                      keyboardType: TextInputType.text,
                      text: 'Zip Code',
                    ),
                    SizedBox(height: AppSize.s20),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _pickLocation();
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          child: Text(
                            'Pick Location',
                            style: GoogleFonts.firaSans(
                              fontSize: FontSize.s12,
                              fontWeight: FontWeightManager.bold,
                              color: ColorManager.bluelight,
                              //decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        if (_selectedLocation != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Selected Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}',
                              style: TextStyle(
                                fontSize: 12, // Adjust the size if you use FontSize.s12
                                color: Colors.black54, // Adjust the color if needed
                              ),
                            ),
                          ),
                        // Icon(
                        //   Icons.location_on_outlined,
                        //   color: ColorManager.granitegray,
                        //   size: AppSize.s18,
                        // ),
                      ],
                    ),
                    SizedBox(height: AppSize.s20),

                    SMTextFConst(
                      controller: widget.landmarkController!,
                      keyboardType: TextInputType.text,
                      text: 'Landmark',
                    ),

                  ],
                ),
              ),
              SizedBox(height: AppSize.s10,),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: AppPadding.p24, top: AppPadding.p14),
                child: isLoading
                    ? SizedBox(
                    height: 25,width: 25,
                    child: CircularProgressIndicator( color: ColorManager.blueprime,))
                    : Center(
                  child: CustomElevatedButton(
                    width: AppSize.s105,
                    height: AppSize.s30,
                    text: AppStringEM.save,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await widget.onSavePressed();
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CountySuccessPopup(message: 'Save Successfully',);
                        },
                      );
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Pick google map location
class PickLocationScreen extends StatefulWidget {
  final LatLng initialLocation;
  final Function(LatLng) onLocationPicked;

  const PickLocationScreen({
    required this.initialLocation,
    required this.onLocationPicked,
  });

  @override
  _PickLocationScreenState createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  late GoogleMapController _mapController;
  late LatLng _selectedLocation;

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.initialLocation;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onTap(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
  }

  void _confirmSelection() {
    widget.onLocationPicked(_selectedLocation);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Location'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _confirmSelection,
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            onTap: _onTap,
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('selectedLocation'),
                position: _selectedLocation,
              ),
            },
          ),
        ],
      ),
    );
  }
}




class AddZonePopup extends StatefulWidget {
  final TextEditingController zoneNumberController;
  final Future<void> Function() onSavePressed;
  final Widget? child;
  final String title;
   AddZonePopup({super.key, required this.zoneNumberController, this.child, required this.title, required this.onSavePressed});

  @override
  State<AddZonePopup> createState() => _AddZonePopupState();
}

class _AddZonePopupState extends State<AddZonePopup> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: AppSize.s400,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.bluebottom,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.semiBold,
                          color: ColorManager.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: ColorManager.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p3,
                  horizontal: AppPadding.p20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SMTextFConst(
                      controller: widget.zoneNumberController,
                      keyboardType: TextInputType.text,
                      text: 'Zone Number',
                    ),
                    SizedBox(height: AppSize.s10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.country,
                          style: GoogleFonts.firaSans(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.bold,
                            color: ColorManager.mediumgrey,
                            //decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: AppSize.s5),
                        widget.child!
                      ],
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: AppPadding.p24, top: AppPadding.p14),
                child: isLoading
                    ? SizedBox(
                    height: AppSize.s25,
                    width: AppSize.s25,
                    child: CircularProgressIndicator(
                      color: ColorManager.blueprime,))
                    : Center(
                  child: CustomElevatedButton(
                    width: AppSize.s105,
                    height: AppSize.s30,
                    text: AppStringEM.save,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await widget.onSavePressed();
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CountySuccessPopup(message: 'Save Successfully',);
                        },
                      );
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
