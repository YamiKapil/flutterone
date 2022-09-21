import 'package:flutter/material.dart';
import 'package:flutter_one/flutter_riverpod_app/providers/river_movie_provider.dart';
import 'package:flutter_one/flutter_riverpod_app/river_model/river_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetails extends ConsumerWidget {
  const MovieDetails({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Future<Movies> movie =
        ref.read(moviesProvider.notifier).loadMovie(id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Movie Detail'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder<Movies>(
            future: movie,
            builder: (context, snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                final Movies mov = snapshot.data as Movies;
                children = [
                  Image.network(mov.poster.toString()),
                  const SizedBox(height: 20),
                  Text(
                    '${mov.title} (${mov.year})',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(mov.plot.toString()),
                  )
                ];
              } else if (snapshot.hasError) {
                children = [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: Text('Erorr: ${snapshot.error}'),
                  ),
                ];
              } else {
                children = const [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awating Result...'),
                  ),
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
