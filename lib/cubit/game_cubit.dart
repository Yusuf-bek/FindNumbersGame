import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbersgame/cubit/game_states.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(GameState initialState) : super(initialState);

  int _timerCounter = 0;

  
}
