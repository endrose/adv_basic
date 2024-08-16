import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    //
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-sreen';
  // Widget? activeScreen;

  void switchScreen() {
    setState(() {
      //
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      //
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      //
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      //
      screenWidget = ResultScreen(
        chooseAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
