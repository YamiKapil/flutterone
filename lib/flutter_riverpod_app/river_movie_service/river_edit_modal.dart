import 'package:flutter/material.dart';
import 'package:flutter_one/flutter_riverpod_app/providers/river_movie_provider.dart';
import 'package:flutter_one/flutter_riverpod_app/river_model/river_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatefulBottomSheet extends ConsumerStatefulWidget {
  final Movies movie;
  const StatefulBottomSheet({Key? key, required this.movie}) : super(key: key);
  @override
  _StatefulBottomSheetState createState() => _StatefulBottomSheetState();
}

class _StatefulBottomSheetState extends ConsumerState<StatefulBottomSheet> {
  late Movies movie;
  final _forKey = GlobalKey<FormState>();

  @override
  void initState() {
    // fill the movie data into movie
    movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _forKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a title',
                ),
                initialValue: movie.title,
                // validator receives the text that the user has entered.
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null;
                },
                onChanged: (val) {
                  movie.title = val;
                },
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a year',
                ),
                initialValue: movie.year,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null;
                },
                onChanged: (value) {
                  movie.year = value;
                },
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a description',
                ),
                initialValue: movie.plot,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null;
                },
                onChanged: (value) {
                  movie.plot = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    // Validate return true if the form is valid, or false
                    if (_forKey.currentState!.validate()) {
                      // if the form is valid, display a snackbar.
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                      ref.read(moviesProvider.notifier).updateMovie(
                            movie.id,
                            movie.toJson(),
                          );
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
