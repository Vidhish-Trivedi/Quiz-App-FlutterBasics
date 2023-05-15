import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectChoice, {super.key});
  final void Function(String choice) onSelectChoice;

  @override
  State<QuestionScreen> createState() {
    return (_QuestionScreenState());
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String choice) {
    // Access the "widget" for which this state is being used.
    widget.onSelectChoice(choice);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return (SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledChoices().map((e) {
              // map returns a list, children: List<Widget>, thus we need to "spread [...]" the list.
              return AnswerButton(e, () {answerQuestion(e);});
              // An anonymous function is used as we can not directly pass a function which takes a parameter.
            }),
          ],
        ),
      ),
    ));
  }
}
