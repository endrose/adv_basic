import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    this.startQuiz,
    super.key,
  });
  final void Function()? startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        const SizedBox(
          height: 80,
        ),
        Text(
          'Learn Flutter then fun way!',
          style: GoogleFonts.lato(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 233, 233, 233),
                side: const BorderSide(color: Colors.transparent)),
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            label: const Text('Start Quiz'))
      ],
    ));
  }
}
