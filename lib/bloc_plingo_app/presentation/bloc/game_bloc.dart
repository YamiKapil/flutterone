import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data.dart';
import '../../domain.dart';

part 'game_event.dart';
part 'game_state.dart';

/// Handles all logic related to the game.
class GameBloc extends Bloc<GameEvent, GameState> {
  /// Constructor
  GameBloc(this._statsRepository) : super(GameState(guesses: emptyGuesses()));

  /// Interacts with storage for updating game stats.
  final GameStatsRepository _statsRepository;

  // TODO: Add logic for GameStarted
  // TODO: Add logic for GameFinished
  // TODO: Add logic for LetterKeyPressed
}
