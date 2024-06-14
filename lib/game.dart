import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameLogic extends StatefulWidget {
  final String name1;
  final String name2;

  const GameLogic({required this.name1, required this.name2});

  @override
  State<GameLogic> createState() => _GameLogicState();
}

class _GameLogicState extends State<GameLogic> {

  late String currentPlayer;
  late String player1;
  late String player2;

  bool isTap1 = false;
  bool isTap2 = false;
  bool isTap3 = false;
  bool isTap4 = false;
  bool isTap5 = false;
  bool isTap6 = false;
  bool isTap7 = false;
  bool isTap8 = false;
  bool isTap9 = false;

  static bool state1 = true;
  static bool state2 = true;
  static bool state3 = true;
  static bool state4 = true;
  static bool state5 = true;
  static bool state6 = true;
  static bool state7 = true;
  static bool state8 = true;
  static bool state9 = true;

  @override
  void initState() {
    super.initState();
    // Initialize currentPlayer with widget.name1
    currentPlayer = widget.name1;
    player1 = widget.name1;
    player2 = widget.name2;
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    padding: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF000080)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.name1,
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'HoneyCrepes',
                                color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.close, color: Colors.red, size: 45),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF000080)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.name2,
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'HoneyCrepes',
                                color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.circle_outlined,
                              color: Colors.yellow, size: 45),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 5.0, right: 5.0),
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  padding: EdgeInsets.all(15.0),
                  children: [
                    buildInkWellWidget(isTap1, state1, 1, currentPlayer),
                    buildInkWellWidget(isTap2, state2, 2, currentPlayer),
                    buildInkWellWidget(isTap3, state3, 3, currentPlayer),
                    buildInkWellWidget(isTap4, state4, 4, currentPlayer),
                    buildInkWellWidget(isTap5, state5, 5, currentPlayer),
                    buildInkWellWidget(isTap6, state6, 6, currentPlayer),
                    buildInkWellWidget(isTap7, state7, 7, currentPlayer),
                    buildInkWellWidget(isTap8, state8, 8, currentPlayer),
                    buildInkWellWidget(isTap9, state9, 9, currentPlayer),
                  ]
              ),
            ),
          )
        ],
      ),
    );
  }

  //  you are passing a reference to the actual isTap1 variable in memory, not a copy of its value. Therefore, any changes made to isTap1 within that method or widget will reflect the changes to the original isTap1 variable.
  Widget buildInkWellWidget(bool isTap, bool state, int index, String player) {


    return InkWell(
      child: AnimatedContainer(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF000080),
        ),
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Icon(
            key: ValueKey<bool>(isTap),
            (player == player1) ? Icons.close : Icons.circle_outlined,
            color: isTap ? ((player == player1) ? Colors.red : Colors.yellow) : Color(0xFF000080),
            size: 70,
          ),
        ),
      ),
      onTap: () {
        print("onTap triggered for widget $index, state=$state, isTap=$isTap");
        if (state) {
          print("Widget $index Pressed!");
          setState(() {
            switch (index) {
              case 1:
                isTap1 = !isTap1;
                state1 = false;
                break;
              case 2:
                isTap2 = !isTap2;
                state2 = false;
                break;
              case 3:
                isTap3 = !isTap3;
                state3 = false;
                break;
              case 4:
                isTap4 = !isTap4;
                state4 = false;
                break;
              case 5:
                isTap5 = !isTap5;
                state5 = false;
                break;
              case 6:
                isTap6 = !isTap6;
                state6 = false;
                break;
              case 7:
                isTap7 = !isTap7;
                state7 = false;
                break;
              case 8:
                isTap8 = !isTap8;
                state8 = false;
                break;
              case 9:
                isTap9 = !isTap9;
                state9 = false;
                break;
            }
          });
        }
      },
    );

  }
}
