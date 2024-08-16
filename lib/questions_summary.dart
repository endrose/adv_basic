import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            //
            print({
              // "dataTest": data['question'],
              // "dataAnswer": data['user_answer'],
              // "summaryData": summaryData,
            });
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 35, right: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: data['user_answer'] == data['correct_answer']
                          ? Colors.green
                          : Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(color: Colors.black),
                    // textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                          color: data['user_answer'] == data['correct_answer']
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      Text(data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: data['user_answer'] != data['correct_answer']
                                ? Colors.green
                                : Colors.red,
                          )),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
