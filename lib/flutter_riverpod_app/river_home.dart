import 'package:flutter/material.dart';
import 'package:flutter_one/flutter_riverpod_app/river_screen/river_movie_details.dart';
import 'package:flutter_one/flutter_riverpod_app/river_screen/river_movie_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RiverHome extends ConsumerWidget {
  RiverHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: ((context, state) => const RiverMovieList()),
      ),
      GoRoute(
        path: '/:id',
        // use state.params to get router parameter values
        // final family = Ffamilies.family(state.params['fid]!);
        builder: ((context, state) {
          final id = state.params["id"];
          return MovieDetails(id: id.toString());
        }),
      ),
    ],
  );
}
