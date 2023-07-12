import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/failure.dart';
import 'package:quiz/question.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/reset.dart';
import 'package:quiz/success.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  var currentQuestion = 0;
  var correctQuestions = 0;

  void answer(String value) {
    setState(() {
      if (currentQuestion < questions.length) {
        var correctAnswer =
            questions.elementAt(currentQuestion)["correctAnswer"] as String;

        if (correctAnswer == value) {
          correctQuestions++;
        }
      }

      currentQuestion++;
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestion = 0;
      correctQuestions = 0;
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
            children: currentQuestion < questions.length
                ? [
                    QuestionText(text: getQuestionTitle()),
                    AnswerButton(
                        action: answer, text: getAnswerOption(0), value: 'a'),
                    AnswerButton(
                        action: answer, text: getAnswerOption(1), value: 'b'),
                    AnswerButton(
                        action: answer, text: getAnswerOption(2), value: 'c'),
                    AnswerButton(
                        action: answer, text: getAnswerOption(3), value: 'd'),
                    AnswerButton(
                        action: answer, text: getAnswerOption(4), value: 'e'),
                  ]
                : [
                    correctQuestions >= 2
                        ? SuccessResult(correctQuestions: correctQuestions)
                        : FailureResult(correctQuestions: correctQuestions),
                    ResetButton(action: resetQuiz)
                  ],
          )),
    );
  }
}
