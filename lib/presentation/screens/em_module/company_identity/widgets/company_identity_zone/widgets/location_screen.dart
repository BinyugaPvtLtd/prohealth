import 'dart:convert';
import 'dart:html' as html; // For browser back button

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth/app/constants/app_config.dart';
import 'package:prohealth/app/resources/color.dart'; // Replace with your actual config path

class MapScreen extends StatefulWidget {
  final LatLng initialLocation;
  final Function(LatLng) onLocationPicked;

  const MapScreen({
    Key? key,
    required this.initialLocation,
    required this.onLocationPicked,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  late LatLng _selectedLocation;
  final TextEditingController _searchController = TextEditingController();

  final String _googleApiKey = AppConfig.googleApiKey;

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.initialLocation;

    // 👇 Handle browser back button (Flutter Web only)
    html.window.onPopState.listen((event) {
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onTap(LatLng position) {
    setState(() {
      _selectedLocation = position;
    });
  }

  void _confirmSelection() {
    widget.onLocationPicked(_selectedLocation);
    Navigator.pop(context, _selectedLocation);
  }

  Future<void> _searchZip(String zipCode) async {
    try {
      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$zipCode&key=$_googleApiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK') {
          final location = data['results'][0]['geometry']['location'];
          final latLng = LatLng(location['lat'], location['lng']);

          _mapController.animateCamera(
            CameraUpdate.newLatLngZoom(latLng, 14.0),
          );

          setState(() {
            _selectedLocation = latLng;
            print('Search lat long ${_selectedLocation}');
          });
        } else {
          _showSnackBar("No results found for ZIP code.");
        }
      } else {
        _showSnackBar("API error: ${response.statusCode}");
      }
    } catch (e) {
      _showSnackBar("Failed to fetch location: $e");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            onTap: _onTap,
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: MarkerId('selected'),
                position: _selectedLocation,
              )
            },
          ),
          Positioned(
            top: 40,
            right: 16,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 320,
                  height: 37,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (val) {
                      final zip = val.trim();
                      if (zip.isNotEmpty) {
                        _searchZip(zip);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Search ZIP Code",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical:7),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          final zip = _searchController.text.trim();
                          if (zip.isNotEmpty) {
                            _searchZip(zip);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  spacing: 30,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      side: BorderSide(color: ColorManager.blueprime)),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Cancel",style: TextStyle(color: ColorManager.blueprime),),
                    ),
                    ElevatedButton(
                      onPressed: _confirmSelection,
                      child: Text("Confirm"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
