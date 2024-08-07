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

  List<bool> isTapped = List.filled(9, false);
  List<String> cellState = List.filled(9, '');
  List<Icon?> cellIcons = List.filled(9, null); // by default

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
                          padding: const EdgeInsets.all(9.0),
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
                children: List.generate(9, (index) {
                  return buildInkWellWidget(
                      isTapped[index], cellState[index], index);
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildInkWellWidget(bool isTapped, String player, int index) {
    Icon cross = Icon(key: ValueKey<String>(player),
        Icons.close,
        color: Colors.red,
        size: 70);

    Icon circle = Icon(key: ValueKey<String>(player),
        Icons.circle_outlined,
        color: Colors.yellow,
        size: 70);

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
          child: (this.isTapped[index])
              ? (player == player1 ? cross : circle)
              : Icon(Icons.abc, color: Color(0xFF000080)),
        ),
      ),
      onTap: () {
        if (!isTapped) {
          setState(() {
            this.isTapped[index] = true;
            cellState[index] = currentPlayer;
            cellIcons[index] = currentPlayer == player1 ? cross : circle;
            checkResult(cross, circle);
            currentPlayer = currentPlayer == player1 ? player2 : player1;
          });
        }
      },
    );
  }

  void checkResult(Icon cross, Icon circle) {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    Icon? firstIcon;
    Icon? secondIcon;
    Icon? thirdIcon;

    for (var pattern in winPatterns) {

      if (cellState[pattern[0]] == cellState[pattern[1]] &&
          cellState[pattern[1]] == cellState[pattern[2]] &&
          cellState[pattern[0]] != '') {

        firstIcon = cellIcons[pattern[0]];
        secondIcon = cellIcons[pattern[1]];
        thirdIcon = cellIcons[pattern[2]];

        List<Icon?> winnerList = [firstIcon,secondIcon,thirdIcon];


        print("${cellState[pattern[0]]} has won!");

        return;
      }
    }
  }
}
