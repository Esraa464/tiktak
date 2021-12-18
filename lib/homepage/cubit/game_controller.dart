import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktak/homepage/states.dart';

import '../game_logic.dart';

class GameCubit extends Cubit<GameStates> {
  GameCubit() : super(InitialGameState());

  static GameCubit get(context) => BlocProvider.of(context);
  bool isSwitched = false;
  String activePlayer = 'X';
  String result = '';
  bool gameOver = false;
  Game game = Game();
  int turn = 0;

  void onSwatchChange(bool val) {
    isSwitched = val;
    emit(OnSwitchState());
  }

  void repeatTheGame() {
    Player.playerX = [];
    Player.playerO = [];

    isSwitched = false;
    activePlayer = 'X';
    result = '';
    turn = 0;
    emit(RepeatGameState());
  }

  onTapItem(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);

      updateState();
      if (!isSwitched && !gameOver && turn != 9) {
        //&& !gameOver
        await game.autoPlay(activePlayer);

        updateState();
      }
    }
  }

  void updateState() {
    activePlayer = (activePlayer == 'X') ? 'O' : 'X';
    turn++;
    String winnerPlayer = game.checkWinner();
    if (winnerPlayer != '') {
      // gameOver = true;
      // repeatTheGame();
      result = '$winnerPlayer is the winner';
    } else if (!gameOver && turn == 9) {
      result = 'It\'s Drawn';
    }
    emit(ActivePlayerState());
  }
}
