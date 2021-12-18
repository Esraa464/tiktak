import 'package:flutter/material.dart';
import 'package:tiktak/homepage/game_logic.dart';

import '../cubit/game_controller.dart';

class GameGrid extends StatelessWidget {
  const GameGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = GameCubit.get(context);

    return Expanded(
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: List.generate(
            9,
            (index) => InkWell(
                onTap: () {
                  cubit.gameOver == true ? null : cubit.onTapItem(index);
                },
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    Player.playerX.contains(index)
                        ? 'X'
                        : Player.playerO.contains(index)
                            ? 'O'
                            : "",
                    style: TextStyle(
                        fontSize: 55,
                        color: Player.playerX.contains(index)
                            ? Colors.blue
                            : Colors.pink),
                  )),
                ))),
      ),
    );
  }
}
