// package we need for json encode/decode
import 'dart:convert';

// service helper for loading json file
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' as _rootbundle;

class MovieService {
  // Future<List<dynamic>> fetchMovies() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   // Load json data
  //   final moviesData =
  //       await _rootbundle.rootBundle.loadString('assets/data/movie.json');
  //   // Decode json data to list
  //   return json.decode(moviesData) as List<dynamic>;
  // }

  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://62d29214afb0b03fc5a80930.mockapi.io',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    ),
  );

  Future<List<dynamic>> fetchDioMovies([filter = '']) async {
    // Load json data
    final movieData = await _dio.get('/movies?Title=$filter');
    // Decode json data to list
    return movieData.data;
  }

  Future<dynamic> fetchMovie(id) async {
    final moviesData = await _dio.get('/movies/$id');
    //Decode json data to list
    return moviesData.data;
  }

  Future<dynamic> updateMovie(id, movieData) async {
    // Load json data
    try {
      final response = await _dio.put(
        '/movies/$id',
        data: movieData,
      );
      return response.data;
    } on DioError catch (err) {
      throw err;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> deleteMovie(id) async {
    // Load json data
    try {
      final response = await _dio.delete('/movies/$id');
      return response.data;
    } on DioError catch (err) {
      throw err;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<dynamic>> fetchLocalMovies() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    // Load json data
    final moviesData =
        await _rootbundle.rootBundle.loadString('data/movies.json');
    // Decode json data to list
    return json.decode(moviesData) as List<dynamic>;
  }
}
