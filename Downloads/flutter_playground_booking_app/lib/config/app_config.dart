// class AppConfig {
//   static const String baseURL = "https://lytechxagency.website/turf/wp-json/wp/v1";
// }

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://lytechxagency.website/turf/wp-json/wp/v1';
  final String baseUrl2 = 'https://lytechxagency.website/turf/wp-json/wp/v2';

Future<int> getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int userId = prefs.getInt('user_id') ?? 0;
  print('Retrieved user_id: $userId'); // Debug print
  return userId; // Return 0 if userId is null
}

  // Future<int> getUserId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt('user_id') ?? 0 ;  
  //   }

    Future<http.Response> getAPI(String endpoint) async {
        // final userId = await getUserId();
        final response = await http.get(
          Uri.parse('$baseUrl/$endpoint'),
          headers: {
            // 'Authorization': 'Token $token',
            'Content-Type': 'application/json',
          },
        );
        return response;
      }
    Future<http.Response> getApi(String endpoint) async {
        // final userId = await getUserId();
        final response = await http.get(
          Uri.parse('$baseUrl2/$endpoint'),
          headers: {
            // 'Authorization': 'Token $token',
            'Content-Type': 'application/json',
          },
        );
        return response;
      }
    // POST API
    Future<dynamic> postAPI(String endpoint ,Map<String,dynamic> body) async {
      // int userId = await getUserId();
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        body : json.encode(body),
        // headers: headers ?? 
        // {
        //   'Content-Type' : 'application/json',
        //   // 'Authorization' : 'Token $token'
        // },
      );
      return response;
    }

    // PATCH API
    Future<dynamic> patchAPI(String endpoint ,Map<String,dynamic> body) async {
      // int userId = await getUserId();
      final response = await http.patch(
        Uri.parse('$baseUrl/$endpoint'),
        body : json.encode(body),
        // headers: headers ?? 
        // {
        //   'Content-Type' : 'application/json',
        //   // 'Authorization' : 'Token $token'
        // },
      );
      return response;
    }

}