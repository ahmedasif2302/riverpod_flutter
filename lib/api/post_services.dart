import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:riverpod_test/api/api_services.dart';

class PostSerivce {
  Future<List<Map<String, dynamic>>> getAllPosts(int? page) async {
    try {
      http.Response response = await http.get(Uri.parse(
          '${ApiServices.baseUrl + ApiServices.posts}?_start=$page&_limit=6'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        log('Server with status code 400');
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
