import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.switcher, {super.key});

  void Function() switcher;

  TextStyle style({required double fontSize}) {
    return TextStyle(
      color: Colors.purple[200],
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 48, 5, 82),
            Color.fromARGB(255, 65, 5, 84),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(140, 255, 255, 255),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Learn flutter the fun way!',
              style: style(fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: switcher,
              icon: const Icon(Icons.arrow_right,
                  size: 30, color: Color.fromARGB(140, 255, 255, 255)),
              label: Text(
                'Start quiz',
                style: style(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
