import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.choice, this.btnAction, {super.key});

  final String choice;
  final void Function() btnAction;

  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: btnAction,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(200, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 3,
        ),
      ),
      child: Text(
        choice,
        style: const TextStyle(
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    ));
  }
}
