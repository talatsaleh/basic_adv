import 'package:adv_basics/main.dart';
import 'package:adv_basics/models/quiz_questions.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key, required this.choseAnswer});

  void Function(String) choseAnswer;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.choseAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 63, 9, 108),
            Color.fromARGB(255, 83, 8, 108),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: Container(
          width: sizeOfScreen.width * .8,
          height: sizeOfScreen.height * .5,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 48, 5, 82),
                Color.fromARGB(255, 65, 5, 84),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black87,
                blurRadius: 4,
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
                  textAlign: TextAlign.center,
                  questions[currentQuestionIndex].question,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 216, 100, 255),
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: questions[currentQuestionIndex]
                      .getShuffleAnswers()
                      .map((answer) {
                    return ElevatedButton(
                      onPressed: () => answerQuestion(answer),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white60,
                          backgroundColor:
                              const Color.fromARGB(200, 83, 8, 108),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(answer),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
