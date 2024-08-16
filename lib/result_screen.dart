import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final void Function() onRestart;
  final List<String> chooseAnswers;

  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.chooseAnswers,
  });

  List<Map<String, Object>> get summaryData {
    //
    final List<Map<String, Object>> summary = [];
    //

    for (var i = 0; i < chooseAnswers.length; i++) {
      //

      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numberOfQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your answered $numberOfCorrectAnswers out $numberOfQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
