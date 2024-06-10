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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        padding: EdgeInsets.all(30.0),
        children: [
          Container(
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
          Container(
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
          // Padding(
          //   padding: EdgeInsets.only(top: 50, left: 5.0, right: 5.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Color(0xFF000080)),
          //     child: GridView.count(
          //       crossAxisCount: 3,
          //       crossAxisSpacing: 20,
          //       padding: EdgeInsets.all(30.0),
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Color(0xFF000080)),
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Color(0xFF000080)),
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Color(0xFF000080)),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
