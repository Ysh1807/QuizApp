import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topLeft; // use 'const' when value known
const endAlignment =
    Alignment.bottomRight; // use 'final' when value unknown at compile time

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 150),
          Image.asset(
            'assets/images/quiz.png',
            width: 600,
            height: 300,
            color: const Color.fromARGB(
                150, 255, 255, 255), //can also wrap with Opacity widget
          ),
          const SizedBox(height: 70),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 15),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'), // if icon not child
          )
        ],
      ),
    );
  }
}
