import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../river_model/river_model.dart';
import '../river_movie_service/river_movie_service.dart';
import 'package:flutter/services.dart' as _rootbundle;

part 'river_movie_provider.freezed.dart';

// Creating state where the freezed annotation will suggest
// that boilerplate code needs to be generated
@freezed
abstract class RiverMovieState with _$RiverMovieState {
  const factory RiverMovieState({
    @Default([]) List<Movies> movies,
    @Default(true) bool isLoading,
  }) = _RiverMovieState;

  const RiverMovieState._();
}

// Creating state notifier provider
final moviesProvider = StateNotifierProvider<MovieNotifier, RiverMovieState>(
    (ref) => MovieNotifier());

// Creating Notifier
class MovieNotifier extends StateNotifier<RiverMovieState> {
  // Notifier constructor - call functions on provider initialization
  MovieNotifier() : super(const RiverMovieState()) {
    loadMovies();
  }

  //Simple load Movies function that will load json file from data folder
  loadMovies() async {
    state = state.copyWith(isLoading: true);
    final movieList = await MovieService().fetchDioMovies();
    // Convert list to list of movies using the movie class constructor
    final movies = movieList.map((e)=> Movies.fromJson(e)).toList();
    // Update state in provider
    state = state.copyWith(movies: movies, isLoading: false);
  }

  Future<Movies> loadMovie(id) async {
    final movieData = await MovieService().fetchMovie(id);
    // convert list to list of mocies using the movie class constructor
    final movie = Movies.fromJson(movieData);
    return movie;
  }

  filterMovies(String filter) async {
    state = state.copyWith(isLoading: true);
    final moviesList = await MovieService().fetchDioMovies(filter);
    // Convert list to list of movies using the movie class constructor
    // with simple filter title function inside
    final movies = moviesList
        .map((e) => Movies.fromJson(e))
        .toList()
        .where((element) =>
            element.title!.toLowerCase().contains(filter.toLowerCase()))
        .toList();

    state = state.copyWith(movies: movies, isLoading: false);
  }

  updateMovie(id, movieData) async {
    //state = state.copyWith(isLoading: true);
    final movieJson = await MovieService().updateMovie(id, movieData);
    // Convert list to list of movies using the movie class constructor
    final movie =  Movies.fromJson(movieJson);

    final index = state.movies.indexWhere((element) => element.id == movie.id);
    final movies = List<Movies>.from(state.movies);
    movies[index] = movie;
    // Update state in provider
    state = state.copyWith(movies: movies, isLoading: false);
  }

  deleteMovie(id) async {
    //state = state.copyWith(isLoading: true);
    final movieJson = await MovieService().deleteMovie(id);
    // Convert list to list of movies using the movie class constructor

    final index = state.movies.indexWhere((element) => element.id == id);
    final movies = List<Movies>.from(state.movies);
    movies.removeAt(index);
    // Update state in provider
    state = state.copyWith(movies: movies, isLoading: false);
  }
}
