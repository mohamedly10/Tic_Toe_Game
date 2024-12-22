import 'package:flutter/material.dart';
import 'package:x_o_game/Entity/Game.dart';
import 'package:x_o_game/core/constant/constant.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TicTacToeGame playGame = TicTacToeGame();

  bool isFabVisible = false;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return
      Scaffold(
       
        floatingActionButton: isFabVisible
            ? FloatingActionButton(
                onPressed: () {
                  playGame.resetBoard();
                  setState(() {});
                },
                backgroundColor: Colors.yellow,
                child: const Icon(Icons.restart_alt),
              )
            : null,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/bg.jpg',))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          playGame.players[0].name,
                          style: const TextStyle(fontSize: 20,height: 0, color: Colors.white,fontFamily: "XO"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(image:DecorationImage(image: AssetImage(Constant.ScoreImage))),
                          child: Text(
                            "${ playGame.players[0].score}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 70,height: 0, color: Colors.white,fontFamily: "XO"),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          playGame.players[1].name,
                          style: const TextStyle(fontSize: 20,height: 0, color: Colors.white,fontFamily: "XO"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(image:DecorationImage(image: AssetImage(Constant.ScoreImage))),
                          child: Text(
                            "${ playGame.players[1].score}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 70,height: 0, color: Colors.white,fontFamily: "XO"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight, // Adjust height as needed
                  child: GridView.builder(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    // Horizontal scrolling
                    itemCount: playGame.board.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of rows
                     // crossAxisSpacing: 20.0,
                     // mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
          playGame.makeMove(index);
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding:EdgeInsets.zero,
                          margin: const EdgeInsets.all(10),
                          decoration:  const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color:Colors.black,blurRadius: 10,spreadRadius: 1,
                              )
                            ],
                            image: DecorationImage(
                                image:AssetImage('assets/image/board.jpg')),
                          ),
                          child:
                             playGame.board[index].isEmpty?
                             Image.asset('assets/image/board.jpg'):
                            Image.asset(playGame.board[index]),



                          // child: Text(
                          //   textAlign: TextAlign.center,
                          //   playGame.board[index],
                          //   style: const TextStyle(
                          //     height: 1,
                          //     fontSize: 100,
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
