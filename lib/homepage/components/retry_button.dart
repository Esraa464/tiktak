import 'package:flutter/material.dart';

import '../cubit/game_controller.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = GameCubit.get(context);

    return ElevatedButton.icon(
      onPressed: () => cubit.repeatTheGame(),
      icon: const Icon(Icons.replay),
      label: const Text('Repeat the game'),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).splashColor)),
    );
  }
}
