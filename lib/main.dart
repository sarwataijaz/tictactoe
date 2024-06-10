import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tictactoe/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:200.0),
                  child: Text("Who's playing?", style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HoneyCrepes',
                    color: Colors.white
                  ),
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 5.0, left: 30.0, right: 30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Player One",
                      filled: true,
                      fillColor: Color(0xFF000080),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                      prefixIcon: Icon(Icons.close, color: Colors.red, size: 45),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 5.0, left: 30.0, right: 30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Player Two",
                      filled: true,
                      fillColor: Color(0xFF000080),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                      prefixIcon: Icon(Icons.circle_outlined, color: Colors.yellow, size: 35),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 5.0, left: 30.0, right: 30.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement( // replaces current route with new route
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 1000),
                            child: GameLogic(
                              name1: "player1", // Provide parameter values here
                              name2: "player2",
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "START GAME",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HoneyCrepes',
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      ),
                  ),
                  ),
              ],
          )
        ),
      );
    }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {

      if (status == AnimationStatus.completed) {
        print("Animation Completed");
        print("Navigator Context: $context");

        Navigator.pushReplacement( // replaces current route with new route
          context,
          PageTransition(
            type: PageTransitionType.topToBottom,
            duration: Duration(milliseconds: 1000),
            child: MyHomePage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          child: Lottie.asset(
            'assets/images/tictactoe_intro.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.forward();
            },
            width: 400,
            height: 400,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}