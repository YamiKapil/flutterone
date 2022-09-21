import 'package:flutter/material.dart';
import 'package:flutter_one/flutter_riverpod_app/providers/river_movie_provider.dart';
import 'package:flutter_one/flutter_riverpod_app/widgets/movie_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../river_model/river_model.dart';

class RiverMovieList extends ConsumerWidget {
  const RiverMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, dynamic>> jsonMovies = [
      {
        "Title": "Dog",
        "Year": "2022",
        "Genre": ["Comedy, Drama"],
        "Plot":
            "Two former Army Rangers are paired against their will on the road trip of a lifetime. Briggs (Channing Tatum) and Lulu (a Belgian Malinois) race down the Pacific Coast to get to a fellow soldier's funeral on time.",
        "Poster":
            "https://m.media-amazon.com/images/M/MV5BYjA2MDM2YjctYzNhNC00NGEzLWFmYWEtODExODFkNmUyOGE2XkEyXkFqcGdeQXVyODk2NDQ3MTA@._V1_SX300.jpg",
        "imdbRating": "6.5",
        "Type": "movie"
      },
    ];
    // List<Movies> formattedMovies =
    //     jsonMovies.map((element) => Movies.fromJson(element)).toList();

    List<Movies> formattedMovies = ref.watch(moviesProvider).movies;
    bool isLoading = ref.watch(moviesProvider).isLoading;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the search term',
                ),
                onChanged: (text) async {
                  // text here is inputed text
                  await ref.read(moviesProvider.notifier).filterMovies(text);
                },
              ),
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: formattedMovies.length,
                        itemBuilder: (BuildContext context, int index) {
                          Movies movie = formattedMovies[index];
                          return MovieCard(movie: movie);
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
