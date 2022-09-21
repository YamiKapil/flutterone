import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_one/flutter_bloc/bloc/pizza_bloc.dart';

import 'model/pizza_model.dart';

class FlutterBloc extends StatelessWidget {
  const FlutterBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Scaffold(
      body: Center(
        child: Container(
          child: BlocBuilder<PizzaBloc, PizzaState>(
            builder: (context, state) {
              if (state is PizzaInitial) {
                return const CircularProgressIndicator.adaptive();
              }
              if (state is PizzaLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.pizzas.length}',
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          for (int index = 0;
                              index < state.pizzas.length;
                              index++)
                            Positioned(
                              left: random.nextInt(250).toDouble(),
                              top: random.nextInt(400).toDouble(),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: state.pizzas[index].image,
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(
                    AddPizza(
                      Pizza.pizza[0],
                    ),
                  );
            },
            child: const Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.orange[800],
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(
                    RemovePizza(
                      Pizza.pizza[0],
                    ),
                  );
            },
            child: const Icon(Icons.remove),
            backgroundColor: Colors.orange[800],
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(
                    AddPizza(
                      Pizza.pizza[1],
                    ),
                  );
            },
            child: const Icon(Icons.local_pizza),
            backgroundColor: Colors.orange[800],
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(
                    RemovePizza(
                      Pizza.pizza[1],
                    ),
                  );
            },
            child: const Icon(Icons.remove),
            backgroundColor: Colors.orange[800],
          ),
        ],
      ),
    );
  }
}
