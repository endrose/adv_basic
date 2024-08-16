import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onTap;
  const AnswerButton(
      {required this.answerText, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        ),
        onPressed: onTap,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
