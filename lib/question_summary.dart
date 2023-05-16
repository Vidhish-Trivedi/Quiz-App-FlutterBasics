import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        // Creates a scrollable list of questions.
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
                  decoration: BoxDecoration(
                    border: Border.all(width: 10, color: data["selectedChoice"] == data["correctAnswer"] ? const Color.fromARGB(255, 236, 0, 255) : Colors.lightBlueAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: data["selectedChoice"] == data["correctAnswer"] ? const Color.fromARGB(255, 236, 0, 255) : Colors.lightBlueAccent,
                  ),
                  child: Text(
                    ((data['index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['selectedChoice'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 236, 0, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          data['correctAnswer'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.lightBlueAccent,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 25,)
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
