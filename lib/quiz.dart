import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/start_screen.dart';

import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'Start-Screen';
  List<String> selectedAnswers = [];
  Widget screenWidget = const SizedBox();

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'Results-Screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Start-Screen';
    });
  }

  @override
  Widget build(context) {
    if (activeScreen == 'Start-Screen') {
      screenWidget = StartScreen(switchScreen);
    } else if (activeScreen == 'Questions-Screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'Results-Screen') {
      screenWidget = ResultsScreen(
        restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(207, 55, 2, 146),
                Color.fromARGB(255, 70, 11, 173),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
