import 'package:flutter/material.dart';
import 'package:flutter_quiz/question_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return (_QuizState());
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreen = "start-screen";

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          child: activeScreen == "start-screen"
              ? StartScreen(switchScreen)
              : const QuestionScreen(),
        ),
      ),
    ));
  }
}
