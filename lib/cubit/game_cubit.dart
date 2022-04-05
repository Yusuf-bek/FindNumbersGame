import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbersgame/cubit/game_states.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(GameState initialState) : super(initialState);
  int timerCounter = 4;

  List<bool> isVisibleList = [true, true, true, true, true, true];

  List<int> generatedNumbers = [1, 2, 3, 4, 5, 6];
  List<int> sortedGeneratedNumbers = [-1, -1, -1, -1, -1, -1];

  int step = 0;

  void startTimer() {
    resetAll();
    generateNumbers();
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

  void resetAll() {
    timerCounter = 4;
    step = 0;
    isVisibleList.forEach((element) {
      if (element == false) {
        element = true;
      }
    });
  }

  void makeInVisible() {
    List<bool> a = isVisibleList.map((e) => false).toList();
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

  void checkAndChange(int pushedButtonIndex) {
    sortedGeneratedNumbers.clear();
    sortedGeneratedNumbers.addAll(generatedNumbers);
    sortedGeneratedNumbers.sort();

    if (sortedGeneratedNumbers[step] == generatedNumbers[pushedButtonIndex]) {
      step++;
      isVisibleList[pushedButtonIndex] = true;
      emit(ChangedState());
    }
  }
}
