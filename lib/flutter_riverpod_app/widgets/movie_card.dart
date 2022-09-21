import 'package:flutter/material.dart';
import 'package:flutter_one/flutter_riverpod_app/river_model/river_model.dart';
import 'package:flutter_one/flutter_riverpod_app/river_movie_service/river_edit_modal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/river_movie_provider.dart';

class MovieCard extends ConsumerWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Movies movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          color: const Color(0xfff7f7f7),
          child: Row(
            children: [
              Container(
                width: 80,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  movie.poster.toString(),
                  errorBuilder: ((context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      color: Colors.blue,
                    );
                  }),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => context.push('/${movie.id}'),
                      child: Text(
                        '${movie.title} ${movie.year}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${movie.plot}',
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return StatefulBottomSheet(movie: movie);
                              }),
                          child: const Text('Edit'),
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        // delete button
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                        'Delete ${movie.title.toString()}'),
                                    content: const Text(
                                        'Are you sure you want to delete'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            deleteMovie(movie.id, ref, context),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

deleteMovie(movieId, WidgetRef ref, BuildContext context) {
  ref.read(moviesProvider.notifier).deleteMovie(movieId);
  Navigator.pop(context);
}
