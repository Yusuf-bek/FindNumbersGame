import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          giveTimerContainer(context),
          Center(
            child: Wrap(
              children: [
                giveNumberCircleAvatar(
                    context: context, number: "1", onTap: () {}),
                giveNumberCircleAvatar(
                    context: context, number: "1", onTap: () {}),
                giveNumberCircleAvatar(
                    context: context, number: "1", onTap: () {}),
                giveNumberCircleAvatar(
                    context: context, number: "1", onTap: () {}),
                giveNumberCircleAvatar(
                    context: context, number: "1", onTap: () {}),
                giveNumberCircleAvatar(
                    context: context, number: "1", onTap: () {}),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.1,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Generate",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container giveTimerContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.2,
      child: const Center(
        child: Text(
          "1",
          style: TextStyle(fontSize: 50),
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
