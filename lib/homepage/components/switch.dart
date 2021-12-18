import 'package:flutter/material.dart';

import '../cubit/game_controller.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = GameCubit.get(context);

    return SwitchListTile.adaptive(
      activeColor: Colors.green,
      inactiveThumbColor: Colors.grey,
      title: const Text(
        'Turn on/off two player',
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      value: cubit.isSwitched,
      onChanged: cubit.onSwatchChange,
    );
  }
}
