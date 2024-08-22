import 'dart:convert';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/nearby_you_screen/models/nearby_you_model.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
import '../models/nearby_model_data.dart';

class NearbyYouController extends GetxController {
  List<NearbyYouModel> nearlyYoudata = NearbyYouData.getNearbyYouData();
  var turfList = <NearbyYouModel>[].obs;
  ApiService apiService = ApiService();
  Rx<NearbyYouModel?> selectedTurf = Rx<NearbyYouModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchTurflist();
  }

Future<void> fetchTurflist() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print('Location services are disabled.');
    return;
  }

  // Check and request location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permissions are denied');
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    print('Location permissions are permanently denied, we cannot request permissions.');
    return;
  }

  // Get current position with high accuracy
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  final double currentLatitude = position.latitude;
  final double currentLongitude = position.longitude;

  // Print current location with full precision
  print('Current Location: Latitude: ${currentLatitude.toStringAsFixed(8)}, Longitude: ${currentLongitude.toStringAsFixed(8)}');
  final response = await apiService.getApi('turf?&acf_format=standard');
  // final response = await http.get(Uri.parse(
  //     'https://lytechxagency.website/turf/wp-json/wp/v2/turf?&acf_format=standard'));
  
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<NearbyYouModel> loadedTurfs = data.map((json) => NearbyYouModel.fromJson(json)).toList();

    for (var item in loadedTurfs) {
      String locationUrl = item.googleLocationUrl ?? '';
      print('Google Location URL: $locationUrl');

      final coordinates = extractCoordinates(locationUrl);
      final latitude = coordinates['latitude'];
      final longitude = coordinates['longitude'];

      // Print extracted coordinates with full precision
      print('Extracted Coordinates: Latitude: ${latitude?.toStringAsFixed(15)}, Longitude: ${longitude?.toStringAsFixed(15)}');

      item.latitude = latitude;
      item.longitude = longitude;

      if (latitude != null && longitude != null) {
        print('Calculating distance for turf: ${item.title} at coordinates: $latitude, $longitude');
        
        // Calculate distance using full precision
        double distanceInMeters = Geolocator.distanceBetween(
          currentLatitude,
          currentLongitude,
          latitude,
          longitude,
        );

        double distanceInKm = distanceInMeters / 1000;
        item.distance = distanceInKm.toStringAsFixed(2) + ' km';

        print('Calculated Distance for ${item.title}: ${item.distance}');
      } else {
        print('Invalid coordinates for ${item.title}, skipping distance calculation.');
      }
    }

    turfList.value = loadedTurfs;
  } else {
    print('Error fetching turf list');
  }
}

  Map<String, double?> extractCoordinates(String url) {
    url = url.replaceAll(' ', '');

    final RegExp regex = RegExp(r'@(-?\d+\.\d+),(-?\d+\.\d+)');
    final match = regex.firstMatch(url);

    if (match != null) {
      return {
        'latitude': double.tryParse(match.group(1)!),
        'longitude': double.tryParse(match.group(2)!),
      };
    }
    return {'latitude': null, 'longitude': null};
  }

  Future<void> fetchTurfDetails(int id) async {
    final response = await apiService.getAPI('get-turf/$id');
    // final response = await http.get(Uri.parse(
    //     'https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/$id'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      selectedTurf.value = NearbyYouModel.fromJson(data);
    } else {
      print('Error fetching turf details');
    }
  }
}
