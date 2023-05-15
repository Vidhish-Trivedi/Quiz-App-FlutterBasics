import 'package:flutter/material.dart';

class QuizQuestion {
  const QuizQuestion(this.questionText, this.choices);

  final String questionText;
  final List <String> choices;

  List <String> getShuffledChoices() {
    // Return a new list, leaving the original unchanged.
    final List <String> shuffledList = List.of(choices);
    shuffledList.shuffle();
    return(shuffledList);
  }
}
