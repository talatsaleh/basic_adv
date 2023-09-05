import 'dart:ffi';

import 'package:adv_basics/models/quiz_questions.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswer, required this.restart});

  final void Function() restart;
  final List<String> selectedAnswer;

  List<Widget> results() {
    List<Widget> widgets = [];

    for (int i = 0; i < questions.length; i++) {
      Color rightColor = const Color.fromARGB(255, 255, 79, 179);
      if (questions[i].answers[0] == selectedAnswer[i]) {
        rightColor = const Color.fromARGB(255, 138, 255, 210);
      }
      widgets.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(
            label: Text('${i + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            shape: const CircleBorder(),
            backgroundColor: rightColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questions[i].question,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 198, 138, 255),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  selectedAnswer[i],
                  style: TextStyle(fontSize: 12, color: rightColor),
                ),
                Text(
                  questions[i].answers[0],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 138, 171, 255),
                  ),
                )
              ],
            ),
          )
        ],
      ));
      widgets.add(const SizedBox(
        height: 20,
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 77, 12, 84),
            Color.fromARGB(255, 25, 5, 84),
            Color.fromARGB(255, 77, 12, 84),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: Container(
          width: sizeOfScreen.width * .8,
          height: sizeOfScreen.height * .7,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(50, 255, 0, 0),
                Color.fromARGB(50, 250, 0, 255),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 1,
                blurStyle: BlurStyle.outer,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'You Have Answered ${questions[0].rightAnswer(selectedAnswer)} out of ${questions.length} correctly!',
                  style: const TextStyle(
                    color: Color.fromARGB(195, 153, 255, 252),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: results(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 198, 138, 255),
                  ),
                  onPressed: restart,
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Restart',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
