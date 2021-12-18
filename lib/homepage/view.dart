import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktak/homepage/components/switch.dart';
import 'package:tiktak/homepage/cubit/game_controller.dart';
import 'package:tiktak/homepage/components/game_grid.dart';
import 'package:tiktak/homepage/states.dart';
import 'components/retry_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GameCubit(),
        child: BlocConsumer<GameCubit, GameStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Theme
                    .of(context)
                    .primaryColor,
                body: SafeArea(
                  child: MediaQuery
                      .of(context)
                      .orientation == Orientation.portrait ? Column(
                    children: [
                      ...firstBloc(context),
                      GameGrid(),
                      ...lastBloc(context)
                    ],
                  ) :Row(children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...firstBloc(context),
                          const SizedBox(height: 20,),
                          ...lastBloc(context)
                        ],
                      ),
                    ),
                    GameGrid(),
                  ],),
                ),
              );
            }));
  }

  List firstBloc(BuildContext context) {
    final cubit = GameCubit.get(context);

    return [
      SwitchButton(),
      const SizedBox(height: 10,),

      Text(
        "it's ${cubit.activePlayer} turn".toUpperCase(),
        style: const TextStyle(fontSize: 55, color: Colors.white),
      ),
    ];
  }

  List lastBloc(BuildContext context) {
    final cubit = GameCubit.get(context);

    return [
      Text(
        ' ${cubit.result}',
        style: const TextStyle(fontSize: 44, color: Colors.white),
      ),
      RetryButton(),
    ];
  }
}
