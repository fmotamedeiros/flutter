import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
          ),
          body: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(questions
                          .elementAt(currentQuestion)["question"]
                          .toString())
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: answer, child: Text(getAnswerOption(0)))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: answer, child: Text(getAnswerOption(1)))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: answer, child: Text(getAnswerOption(2)))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: answer, child: Text(getAnswerOption(3)))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: answer, child: Text(getAnswerOption(4)))),
              ),
            ],
          )),
    );
  }
}
