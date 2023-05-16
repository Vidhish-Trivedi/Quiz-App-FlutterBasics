import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedChoices, this.onRestart, {super.key});

  final List<String> selectedChoices;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedChoices.length; i++) {
      // Add a Map to the list.
      summary.add({
        "index": i,
        "question": questions[i].questionText,
        "correctAnswer": questions[i].choices[0],
        "selectedChoice": selectedChoices[i],
      });
    }
    return (summary);
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    // Filtering a list.
    final userScore = summaryData
        .where((data) {
          return (data['selectedChoice'] == data['correctAnswer']);
        })
        .toList()
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Answered $userScore questions out of $totalQuestions correctly!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 236, 40, 255),
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.refresh,
                color: Colors.lightBlueAccent,
              ),
              label: const Text(
                "Restart",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
