import 'package:flutter/material.dart';

class TicApp extends StatefulWidget {
  const TicApp({super.key});

  @override
  State<TicApp> createState() => _TicAppState();
}

class _TicAppState extends State<TicApp> {
  List<String> board = List.filled(9, '');
  bool isXTurn = true;
  String result = '';
  bool gameEnd = false;

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      isXTurn = true;
      result = '';
      gameEnd = false;
    });
  }

  void onTileTap(int index) {
    if (board[index] == '' && !gameEnd) {
      setState(() {
        board[index] = isXTurn ? 'X' : 'O';
        isXTurn = !isXTurn;
        result = checkWinner();
      });
    }
  }

  String checkWinner() {
    List<List<int>> winConditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], //Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], //Columns
      [0, 4, 8], [2, 4, 6]
    ];
    for (var condition in winConditions) {
      if (board[condition[0]] != '' &&
          board[condition[0]] == board[condition[1]] &&
          board[condition[1]] == board[condition[2]]) {
        gameEnd = true;
        return '${board[condition[0]]} Wins!';
      }
    }
    if (!board.contains('')) {
      gameEnd = true;
      return 'Draw!';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Simple Tic Tac Toe",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => onTileTap(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                            width: 4,
                          ),
                        ),
                        child: Center(
                          child: Text(board[index],
                              style: const TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: resetGame,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text(
                    'Restart Game',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
