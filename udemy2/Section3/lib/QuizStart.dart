import 'package:flutter/material.dart';

class QuizStart extends StatelessWidget {
  const QuizStart(this.startQuiz,{Key? key}) : super(key: key);

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.indigo,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/GDSCHUFS.png',
              width: 150,
              height: 150,
            ),
          ),
          const Text(
            "Learn Flutter Quiz",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
            label: const Text('Start'),
          )
        ],
      ),
    );
  }
}
