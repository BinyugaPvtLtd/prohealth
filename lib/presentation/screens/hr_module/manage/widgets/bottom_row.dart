import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:prohealth/app/constants/app_config.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'dart:convert';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:http/http.dart' as http;



class BottomBarRow extends StatefulWidget {
  const BottomBarRow({super.key});

  @override
  _BottomBarRowState createState() => _BottomBarRowState();
}

class _BottomBarRowState extends State<BottomBarRow> {

 var  ip ;
 var localresponse;
  String? _ipAddress;
  String? _locationData;
  bool _isFetchingIp = true;
  Future<Map<String, double>?>? _geolocationFuture;
 late Future<String> _stateFuture;


  @override
  void initState() {
    super.initState();
    _fetchIPAddress();
    //_stateFuture = getCurrentLocation();
    //getCurrentLocation();
    // getLocation();
   // _geolocationFuture = _getGeolocation(); // Initialize geolocation fetching
  }
String? _city;
  String? _country;
 Future<void> _fetchIPAddress() async {
   try {
     // Fetch the IP address first
     final ipResponse = await http.get(Uri.parse('https://api.ipify.org?format=json'));
     if (ipResponse.statusCode == 200) {
       final ipData = jsonDecode(ipResponse.body);
       _ipAddress = ipData['ip'];

       // Use the IP address to fetch city and country information
       final locationResponse = await http.get(Uri.parse('http://ip-api.com/json/$_ipAddress'));
       if (locationResponse.statusCode == 200) {
         final locationData = jsonDecode(locationResponse.body);

         setState(() {
           _city = locationData['city'];
           _country = locationData['country'];
           _isFetchingIp = false;
         });
         print('Fetched city and country ${_country} + ${_city}');
       } else {
         print('Failed to load location data');
         setState(() {
           _isFetchingIp = false;
         });
       }
     } else {
       print('Failed to load IP address');
       setState(() {
         _isFetchingIp = false;
       });
     }
   } catch (e) {
     print('Error: $e');
     setState(() {
       _isFetchingIp = false;
     });
   }
 }




 Future getLocation() async {
    var response = await http.get(Uri.parse("http://ip-api.com/json/${ip}"));
    var jsonpares = json.decode(response.body);
    localresponse=jsonpares;
    print(jsonpares);
  }

  getDirectLocation() async{
    await _fetchIPAddress();getLocation();
  }

  /// Fetch live geo Location
 Future<String> getStateFromLatLng(double latitude, double longitude) async {

   try {
     // Initialize the GoogleGeocodingApi with the API key
     final googleGeocodingApi = GoogleGeocodingApi(AppConfig.googleApiKey);

     // Perform reverse geocoding
     final geocodingResponse = await googleGeocodingApi.reverse(
       "${latitude.toString()}, ${longitude.toString()}",
     );

     if (geocodingResponse != null && geocodingResponse.results.isNotEmpty) {
       for (var result in geocodingResponse.results) {
         for (var component in result.addressComponents) {
           if (component.types.contains('administrative_area_level_2')) {
             print('Name : ${component.longName}');
             _locationData = component.longName;
             return component.longName; // State name
           }
         }
       }
       return 'State response.';
     } else {
       return 'No coordinates.';
     }
   } catch (e) {
     print('Error occurred while fetching the state: $e');
     return 'Error: ${e.toString()}';
   }
 }
 Future<String> getCurrentLocation() async {
   bool serviceEnabled;
   LocationPermission permission;

   serviceEnabled = await Geolocator.isLocationServiceEnabled();
   if (!serviceEnabled) {
     print('location des');
     return Future.error('Location disabled.');
   }

   permission = await Geolocator.checkPermission();
   if (permission == LocationPermission.denied) {
     permission = await Geolocator.requestPermission();
     if (permission == LocationPermission.denied) {
       print('permission des');
       return Future.error('Location denied');
     }
   }

   if (permission == LocationPermission.deniedForever) {
     return Future.error(
         'Location permissions are permanently denied, we cannot request permissions.');
   }

   // Get the current position
   Position position = await Geolocator.getCurrentPosition(
       desiredAccuracy: LocationAccuracy.high
   );

   print('Current location: ${position.latitude}, ${position.longitude}');

   // Get the address from the current position
   print('Position : ${position}');
   return await getStateFromLatLng(position.latitude,position.longitude);
 }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // AppSize.s56 or a constant value
      // color: Colors.green,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Text
            Text(
              '--',
              style: TextStyle(
                fontSize: FontSize.s12,
                fontWeight: FontWeight.w400,
                color: Colors.grey, // ColorManager.grey or a color constant
                decoration: TextDecoration.none,
              ),
            ),

            /// IP + Geolocation
            FutureBuilder(
                future: getCurrentLocation(),
                builder: (context,snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: Text("Loading.."));
                  }
                  if(snapshot.data == null){
                    return Text(
                      '--',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800],
                        decoration: TextDecoration.none,
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                  '${snapshot.data} ',
                    // '(${_city})',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                      decoration: TextDecoration.none,
                    ),
                  ),

                      // _locationData != null ? Text(
                      //   '${_locationData} ',
                      //   // '(${_city})',
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.grey[800],
                      //     decoration: TextDecoration.none,
                      //   ),
                      // ) : Text(
                      //   '--',
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.w400,
                      //     color: Colors.grey[800],
                      //     decoration: TextDecoration.none,
                      //   ),
                      // ),
                      SizedBox(
                        width: AppSize.s20,
                      ),
                      _isFetchingIp
                          ? Text(
                        'Loading IP...',
                        style:TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          decoration: TextDecoration.none,
                        ),
                      )
                          : Text(
                        _ipAddress ?? '--',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  );
                }
            ),



            /// Logo
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Column(
                children: [
                  Image.asset(
                    'images/powered_logo.png',
                    width: MediaQuery.of(context).size.width / 60,
                  ),
                  Text(
                    'Powered by',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
