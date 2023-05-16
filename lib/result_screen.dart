import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedChoices, {super.key});

  final List<String> selectedChoices;

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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Results Heading"),
            const SizedBox(
              height: 30,
            ),
            // Create a scrollable list of questions here.
            const Text("To do...."),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Restart"),
            ),
          ],
        )),
      ),
    );
  }
}
