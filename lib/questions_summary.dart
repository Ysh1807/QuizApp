import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.dataSummary, {super.key});

  final List<Map<String, Object>> dataSummary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: dataSummary.map(
          (data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data['user_answer'] == data['correct_answer']
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 95, 175, 240),
                        ),
                        child: Text(
                            ((data['question_index'] as int) + 1).toString()))
                    : Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 179, 65, 245),
                        ),
                        child: Text(
                            ((data['question_index'] as int) + 1).toString())),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 245, 226, 226),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 179, 65, 245)),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 95, 175, 240)),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
