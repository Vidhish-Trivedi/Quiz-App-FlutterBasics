import 'package:flutter/material.dart';

class QuizQuestion {
  const QuizQuestion(this.questionText, this.choices);

  final String questionText;
  final List <String> choices;
}
