import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';
import 'package:quiz/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  var currentQuestion = 0;

  void answer() {
    setState(() {
      currentQuestion++;
    });
  }

  String getAnswerOption(int answerIndex) {
    var answers = questions.elementAt(currentQuestion)["answers"]
        as List<Map<String, String>>;
    var answer = answers.elementAt(answerIndex);
    return answer.values.first;
  }

  String getQuestionTitle() {
    return questions.elementAt(currentQuestion)["question"].toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
          ),
          body: Column(
            children: [
              QuestionText(text: getQuestionTitle()),
              AnswerButton(action: answer, text: getAnswerOption(0)),
              AnswerButton(action: answer, text: getAnswerOption(1)),
              AnswerButton(action: answer, text: getAnswerOption(2)),
              AnswerButton(action: answer, text: getAnswerOption(3)),
              AnswerButton(action: answer, text: getAnswerOption(4)),
            ],
          )),
    );
  }
}
