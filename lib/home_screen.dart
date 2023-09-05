import 'package:adv_basics/models/quiz_questions.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/quizes_screen.dart';
import 'package:flutter/material.dart';

String activeScreen = 'start-screen';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Map<String, Widget> screens;

  List<String> yourAnswer = [];

  void choseAnswer(String answer) {
    yourAnswer.add(answer);
    if (yourAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restart() {
    setState(() {
      yourAnswer = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  void initState() {
    screens = {
      'start-screen': StartScreen(switchBetweenScreens),
      'question-screen': QuizScreen(
        choseAnswer: choseAnswer,
      ),
      'result-screen':
          ResultScreen(selectedAnswer: yourAnswer, restart: restart),
    };
    super.initState();
  }

  @override
  void switchBetweenScreens() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return screens[activeScreen]!;
  }
}
