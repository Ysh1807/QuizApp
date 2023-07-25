import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restart, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummaryResult() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryResult = getSummaryResult();
    final totalQuestions = questions.length;
    final correctQuestions = summaryResult.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctQuestions out of $totalQuestions questions correctly!",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 235, 133, 251),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryResult),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restart,
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 245, 226, 226)),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
