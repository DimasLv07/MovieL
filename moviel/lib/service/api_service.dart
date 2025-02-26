import 'dart:convert';

import 'package:http/http.dart' as http;



class ApiService {
  static const String apiKey = '0339c2fdc8f52abe81d0ce31ec90995f';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  

  Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/week?api_key=$apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }
}
