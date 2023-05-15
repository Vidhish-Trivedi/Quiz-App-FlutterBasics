import 'package:flutter/material.dart';
import 'package:flutter_quiz/question_screen.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:flutter_quiz/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return (_QuizState());
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  List <String> selectedChoices = [];

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String choice) {
    selectedChoices.add(choice);

    if(selectedChoices.length == questions.length) {
      // All questions have been answered.
      // Change screen here.
      setState(() {
        selectedChoices = [];
        activeScreen = "start-screen";
      });
    }
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
              : QuestionScreen(chooseAnswer,),
        ),
      ),
    ));
  }
}
