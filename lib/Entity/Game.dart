import 'package:x_o_game/core/constant/constant.dart';

class Player {
  String name;
  int score = 0;
  late bool isPlayingX;

  Player({required this.name, required this.isPlayingX});
}

class TicTacToeGame {
  late List<Player> players;
  late int moveCount;
  late List<String> board;
  late bool isXTurn;

  TicTacToeGame() {
    moveCount = 0;
    board = ["", "", "", "", "", "", "", "", ""];
    isXTurn = true;
    players = [
      Player(name: "Player 1", isPlayingX: true),
      Player(name: "Player 2", isPlayingX: false)
    ];
  }

  bool checkForDraw() {
    if (moveCount >= 9) {
      print("It's a draw!");
      board.fillRange(0, board.length, "");
      moveCount = 0;
      return true;
    }
    return false;
  }

  void makeMove(int index)
  {
    if (!checkForDraw()) {
      if (board[index] == "") {
        updateBoard(index);
      }
    } else {
      resetBoard();
    }
  }

  void updateBoard(int index) {
    isXTurn ? board[index] = Constant.xPng : board[index] = Constant.OPng;
    moveCount++;
    checkForWin();
    isXTurn = !isXTurn;
  }

  void checkForWin() {
    String currentPlayer = isXTurn ? Constant.xPng : Constant.OPng;
    if (   board[0] == currentPlayer &&
            board[1] == currentPlayer &&
            board[2] == currentPlayer ||
        board[3] == currentPlayer &&
            board[4] == currentPlayer &&
            board[5] == currentPlayer ||
        board[6] == currentPlayer &&
            board[7] == currentPlayer &&
            board[8] == currentPlayer ||
        board[0] == currentPlayer &&
            board[3] == currentPlayer &&
            board[6] == currentPlayer ||
        board[1] == currentPlayer &&
            board[4] == currentPlayer &&
            board[7] == currentPlayer ||
        board[2] == currentPlayer &&
            board[5] == currentPlayer &&
            board[8] == currentPlayer ||
        board[0] == currentPlayer &&
            board[4] == currentPlayer &&
            board[8] == currentPlayer ||
        board[2] == currentPlayer &&
            board[4] == currentPlayer &&
            board[6] == currentPlayer) {
      print("$currentPlayer wins!");
      currentPlayer == Constant.xPng ? players[0].score++ : players[1].score++;
      resetBoard();
    }
    else{}
  }

  void resetBoard() {
    board.fillRange(0, board.length, "");
    moveCount = 0;
  }
}
