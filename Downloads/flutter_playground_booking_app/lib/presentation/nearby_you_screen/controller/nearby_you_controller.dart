import 'dart:convert';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/nearby_you_screen/models/nearby_you_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../models/nearby_model_data.dart';
// import 'package:flutter_map_math/flutter_map_math.dart';
// class NearbyYouController extends GetxController {
//   List<NearbyYouModel> nearlyYoudata = NearbyYouData.getNearbyYouData();
//   var turfList = <NearbyYouModel>[].obs;
  

//   @override
//   void onInit() {
//     super.onInit();
//     fetchTurflist();
//   }

//   Future<void> fetchTurflist() async {
//     // LocationPermission permission = await Geolocator.requestPermission();
//     print('method for nearby called');
//     final response = await http.get(Uri.parse(
//         'https://lytechxagency.website/turf/wp-json/wp/v2/turf?&acf_format=standard'));
//     if (response.statusCode == 200) {
//       print('API called for nearby');
//       List<dynamic> data = jsonDecode(response.body);
//       for (var item in data) {
//         List<NearbyYouModel> loadedTurfs =
//             data.map((json) => NearbyYouModel.fromJson(json)).toList();
//         String locationUrl = item['acf']['google_location_url'];
//         print('Google Location URL: $locationUrl');

//         final coordinates = extractCoordinates(locationUrl);
//         print(
//             'Latitude: ${coordinates['latitude']}, Longitude: ${coordinates['longitude']}');
//         var turf = NearbyYouModel.fromJson(item);
//         turf.latitude = coordinates['latitude'] ?? 12.052;
//         turf.longitude = coordinates['longitude'] ?? 14.025;

//         loadedTurfs.add(turf);
//         if (turf.latitude != null && turf.longitude != null) {
//           await _calculateDistances(turf.latitude!, turf.longitude!, turf);
//         }
//       }
//       List<NearbyYouModel> loadedTurfs =
//           data.map((json) => NearbyYouModel.fromJson(json)).toList();
//       turfList.value = loadedTurfs;
//     } else {
//       print('Error fetching turf list');
//     }
//   }

//   Map<String, double?> extractCoordinates(String url) {
//     final RegExp regex = RegExp(r'@(-?\d+\.\d+),(-?\d+\.\d+)');
//     final match = regex.firstMatch(url);

//     if (match != null) {
//       return {
//         'latitude': double.tryParse(match.group(1)!),
//         'longitude': double.tryParse(match.group(2)!),
//       };
//     }

//     return {'latitude': null, 'longitude': null};
//   }

// //   Future<void> _calculateDistances(
// //       double turfLongitude, double turfLatitude, NearbyYouModel turf) async {
// //     try {
// //       const double fixedLatitude = 25.614900;
// //       const double fixedLongitude = 75.405030;
// //       double distanceInMeters = Geolocator.distanceBetween(
// //         turfLatitude,
// //         turfLongitude,
// //         fixedLatitude,
// //         fixedLongitude,
// //       );

// //       double distanceInKm = distanceInMeters / 1000;
// //       turf.distance = '${distanceInKm.toStringAsFixed(2)} km';
// //       print('Distance: ${distanceInKm.toStringAsFixed(2)} km');
// //     } catch (e) {
// //       print('Error calculating distances: $e');
// //     }
// //   }

// //   Future<void> saveDistance(String distance) async {
// //     final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('stored_distance', distance);
// //   }
// // }



// Future<void> _calculateDistances(
//       double turfLongitude, double turfLatitude , NearbyYouModel) async {
//     try {
//       const double fixedLatitude = 25.88823;
//       const double fixedLongitude = 76.777793;
//       double distanceInMeters = Geolocator.distanceBetween(
//       turfLatitude,
//       turfLongitude,
//       fixedLatitude,
//       fixedLongitude,
//     );

//     double distanceInKm = distanceInMeters / 1000;
//     print('Distance: ${distanceInKm.toStringAsFixed(2)} km');
//       // Position position = await Geolocator.getCurrentPosition(
//       //   desiredAccuracy: LocationAccuracy.high,
//       // );

//       // for (var turf in turfList) {
//       //   if (turf.latitude != null && turf.longitude != null) {
//       //     double distanceInMeters = Geolocator.distanceBetween(
//       //       position.latitude,

//       //       position.longitude,
//       //       turf.latitude!,
//       //       turf.longitude!,
//       //     );

//       //     double distanceInKm = distanceInMeters / 1000;
//       //     turf.distance = "${distanceInKm.toStringAsFixed(2)} km";
//         // }
//       // }
//       turfList.refresh(); // Refresh the observable list to update the UI
//       // print(position.latitude);
//       // print(position.longitude);
//     } catch (e) {
//       print('Error calculating distances: $e');
//     }
//   }
// }
class NearbyYouController extends GetxController {
  List<NearbyYouModel> nearlyYoudata = NearbyYouData.getNearbyYouData();
  var turfList = <NearbyYouModel>[].obs;
  Rx<NearbyYouModel?> selectedTurf = Rx<NearbyYouModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchTurflist();
  }

  Future<void> fetchTurflist() async {
    print('Fetching nearby turfs');
    final response = await http.get(Uri.parse(
        'https://lytechxagency.website/turf/wp-json/wp/v2/turf?&acf_format=standard'));
    if (response.statusCode == 200) {
      print('API called for nearby');
      List<dynamic> data = jsonDecode(response.body);
      List<NearbyYouModel> loadedTurfs = data.map((json) => NearbyYouModel.fromJson(json)).toList();
      
      for (var item in loadedTurfs) {
        String locationUrl = item.googleLocationUrl ?? '';
        print('Google Location URL: $locationUrl');
        final coordinates = extractCoordinates(locationUrl);
        print(
            'Latitude: ${coordinates['latitude']}, Longitude: ${coordinates['longitude']}');
        item.latitude = coordinates['latitude'];
        item.longitude = coordinates['longitude'];

        if (item.latitude != null && item.longitude != null) {
          await _calculateDistances(item.latitude!, item.longitude!, item);
          // await _calculateDistances2(item.latitude!, item.longitude!, item , '');
        }
      }
      turfList.value = loadedTurfs;
    } else {
      print('Error fetching turf list');
    }
  }

  Map<String, double?> extractCoordinates(String url) {
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

  Future<void> _calculateDistances(
      double turfLongitude, double turfLatitude, NearbyYouModel turf) async {
    try {
      const double fixedLatitude = 25.00;
      const double fixedLongitude = 76.00;
      double distanceInMeters = Geolocator.distanceBetween(
        turfLatitude,
        turfLongitude,
        fixedLatitude,
        fixedLongitude,
      );

      double distanceInKm = distanceInMeters / 1000;
      turf.distance = distanceInKm.toStringAsFixed(2) + ' km';
      print('Distance : ${turf.distance}');
      turfList.refresh(); 
    } catch (e) {
      print('Error calculating distances: $e');
    }
  }

  Future<void> fetchTurfDetails(int id) async {
    final response = await http.get(Uri.parse(
        'https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/$id'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      selectedTurf.value = NearbyYouModel.fromJson(data);
    } else {
      print('Error fetching turf details');
    }
  }
  //   Future<void> _calculateDistances2(
  //     double turfLongitude, double turfLatitude, NearbyYouModel turf, String meters) async {
  //   try {
  //     FlutterMapMath mapMath = FlutterMapMath();
  //     const double fixedLatitude = 25.88823;
  //     const double fixedLongitude = 76.777793;
  //     double distanceInMeters = mapMath.distanceBetween(
  //       turfLatitude,
  //       turfLongitude,
  //       fixedLatitude,
  //       fixedLongitude,
  //       meters,
  //     );

  //     double distanceInKm = distanceInMeters / 1000;
  //     turf.distance = distanceInKm.toStringAsFixed(2) + ' km';
  //     print(' distance using method 2 : ${turf.distance}');
  //     turfList.refresh(); 
  //   } catch (e) {
  //     print('Error calculating distances: $e');
  //   }
  // }
}

