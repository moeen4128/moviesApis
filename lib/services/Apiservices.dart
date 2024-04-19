import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_apis_app/Model/FetchModel.dart';

class FetchData {
  static final FetchData instance = FetchData();

  Future<FetchDAtaModel> TrendingMovieesApi() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/movie/day?api_key=3eb62ebcb7a97d57fbcffc17d2b61bff'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['results'] as List;
      // print(jsonData);

      return FetchDAtaModel(
          results: jsonData.map((movie) => Results.fromJson(movie)).toList());
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<FetchDAtaModel> TopradedApisMovie() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=3eb62ebcb7a97d57fbcffc17d2b61bff'));

    if (response.statusCode == 200) {
      // Decode the JSON response into a List<dynamic>
      var jsonData = jsonDecode(response.body)['results'] as List;
      // print(jsonData);

      return FetchDAtaModel(
          results: jsonData.map((movie) => Results.fromJson(movie)).toList());
    } else {
      print('Error: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Error fetching data');
    }
  }

  Future<FetchDAtaModel> UpconingApisMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=3eb62ebcb7a97d57fbcffc17d2b61bff'));

    if (response.statusCode == 200) {
      // Decode the JSON response into a List<dynamic>
      var jsonData = jsonDecode(response.body)['results'] as List;
      // print(jsonData);

      return FetchDAtaModel(
          results: jsonData.map((movie) => Results.fromJson(movie)).toList());
    } else {
      print('Error: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Error fetching data');
    }
  }

  Future<FetchDAtaModel> PopularMoviesApi() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=3eb62ebcb7a97d57fbcffc17d2b61bff'));

    if (response.statusCode == 200) {
      // Decode the JSON response into a List<dynamic>
      var jsonData = jsonDecode(response.body)['results'] as List;
      // print(jsonData);

      return FetchDAtaModel(
          results: jsonData.map((movie) => Results.fromJson(movie)).toList());
    } else {
      // print('Error: ${response.statusCode}');
      // print('Response body: ${response.body}');
      throw Exception('Error fetching data');
    }
  }
}
