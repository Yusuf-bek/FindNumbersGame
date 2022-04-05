import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbersgame/cubit/game_states.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(GameState initialState) : super(initialState);
  int timerCounter = 4;

  List<bool> isVisibleList = [true, true, true, true, true, true];

  List<int> generatedNumbers = [1, 2, 3, 4, 5, 6];
  

  void startTimer() {
    for (int i = timerCounter; i > 0; i--) {
      Future.delayed(
        Duration(seconds: i),
      ).then(
        (value) {
          timerCounter -= 1;
          emit(ChangeTimerState());
          if (timerCounter == 0) {
            makeInVisible();
          }
        },
      );
    }
  }

  void makeInVisible() {
    List<bool> a = isVisibleList.map((e) => !e).toList();
    isVisibleList.clear();
    isVisibleList.addAll(a);
    emit(GameStartedState());
  }

  void generateNumbers() {
    int generatedNumber = Random().nextInt(999999) + 100000;
    generatedNumbers.clear();
    generatedNumbers.addAll(
        generatedNumber.toString().split("").map((e) => int.parse(e)).toList());
    emit(GameStartedState());
  }
}
