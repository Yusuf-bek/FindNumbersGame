import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbersgame/cubit/game_cubit.dart';
import 'package:numbersgame/cubit/game_states.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return GameCubit(InitialState());
        },
        child: BlocConsumer<GameCubit, GameState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  giveTimerContainer(
                    context,
                  ),
                  Center(
                    child: Wrap(
                      children: [
                        giveNumberCircleAvatar(
                            context: context,
                            number: context.watch<GameCubit>().isVisibleList[0]
                                ? context
                                    .read<GameCubit>()
                                    .generatedNumbers[0]
                                    .toString()
                                : "",
                            onTap: () {
                              context.read<GameCubit>().checkAndChange(0);
                            }),
                        giveNumberCircleAvatar(
                          context: context,
                          number: context.watch<GameCubit>().isVisibleList[1]
                              ? context
                                  .read<GameCubit>()
                                  .generatedNumbers[1]
                                  .toString()
                              : "",
                          onTap: () {
                            context.read<GameCubit>().checkAndChange(1);
                          },
                        ),
                        giveNumberCircleAvatar(
                          context: context,
                          number: context.watch<GameCubit>().isVisibleList[2]
                              ? context
                                  .read<GameCubit>()
                                  .generatedNumbers[2]
                                  .toString()
                              : "",
                          onTap: () {
                            context.read<GameCubit>().checkAndChange(2);
                          },
                        ),
                        giveNumberCircleAvatar(
                          context: context,
                          number: context.watch<GameCubit>().isVisibleList[3]
                              ? context
                                  .read<GameCubit>()
                                  .generatedNumbers[3]
                                  .toString()
                              : "",
                          onTap: () {
                            context.read<GameCubit>().checkAndChange(3);
                          },
                        ),
                        giveNumberCircleAvatar(
                          context: context,
                          number: context.watch<GameCubit>().isVisibleList[4]
                              ? context
                                  .read<GameCubit>()
                                  .generatedNumbers[4]
                                  .toString()
                              : "",
                          onTap: () {
                            context.read<GameCubit>().checkAndChange(4);
                          },
                        ),
                        giveNumberCircleAvatar(
                          context: context,
                          number: context.watch<GameCubit>().isVisibleList[5]
                              ? context
                                  .read<GameCubit>()
                                  .generatedNumbers[5]
                                  .toString()
                              : "",
                          onTap: () {
                            context.read<GameCubit>().checkAndChange(5);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ElevatedButton(
                      onPressed: () {
                        
                        context.read<GameCubit>().startTimer();
                      },
                      child: Text(
                        "Generate",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Container giveTimerContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Center(
        child: Text(
          context.watch<GameCubit>().timerCounter.toString(),
          style: const TextStyle(fontSize: 50),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.3),
            Colors.red.withOpacity(0.3),
          ],
        ),
      ),
    );
  }

  InkWell giveNumberCircleAvatar({
    required BuildContext context,
    required String number,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.08,
        child: Text(
          number,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.08,
          ),
        ),
      ),
    );
  }
}
