import 'package:flutter/material.dart';
import 'package:section3/questions_screen.dart';
import 'QuizStart.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  /*
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = QuizStart(switchscreen);
    super.initState();
  }*/

  var activeScreen = 'start-screen';

  void switchscreen() {
    setState(() {
      //activeScreen = const question();
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
    final screenWidget = activeScreen == 'start-screen'
        ? QuizStart(switchscreen)
        : const question();
    */
    Widget screenWidget = QuizStart(switchscreen);
    if (activeScreen == 'question-screen') {
      screenWidget = const question();
    }

    return MaterialApp(
      home: Scaffold(
        //body: activeScreen,
        body: screenWidget,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
