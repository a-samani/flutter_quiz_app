import 'package:flutter/material.dart';
import 'answer.dart';
import 'helper.dart';
import 'question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _question = const [
    {
      'question': 'question 1',
      'answer': [
        {'text': 'ans1', 'isture': false},
        {'text': 'ans2', 'isture': true},
        {'text': 'ans3', 'isture': false},
        {'text': 'ans4', 'isture': false},
      ]
    },
    {
      'question': 'question 2',
      'answer': [
        {'text': 'ans1', 'isture': false},
        {'text': 'ans2', 'isture': false},
        {'text': 'anss3', 'isture': true},
        {'text': 'ans4', 'isture': false},
      ]
    },
    {
      'question': 'question 3',
      'answer': [
        {'text': 'ans1', 'isture': false},
        {'text': 'ans2', 'isture': false},
        {'text': 'ans3', 'isture': false},
        {'text': 'ans4', 'isture': true},
      ]
    },
    {
      'question': 'question 4',
      'answer': [
        {'text': 'ans1', 'isture': true},
        {'text': 'ans2', 'isture': false},
        {'text': 'ans3', 'isture': false},
        {'text': 'ans4', 'isture': false},
      ]
    },
    {
      'question': 'question 5',
      'answer': [
        {'text': 'ans1', 'isture': false},
        {'text': 'ans2', 'isture': true},
        {'text': 'ans3', 'isture': false},
        {'text': 'ans4', 'isture': false},
      ]
    },
  ];
  int _score = 0;
  int _index = 0;
  bool _isDisabled = false;
  bool _moveButtonDisable = true;

  nextQuestion() {
    if (_index < 4) {
      setState(() {
        _index++;
        _moveButtonDisable = true;
        _isDisabled = false;
        AnswerState.isAnswered = false;
      });
    }
  }

  addScore() {
    setState(() {
      _score += 20;
    });
  }

  disableButton() {
    setState(() {
      _isDisabled = true;
      _moveButtonDisable = _index < 4 ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Score: $_score/100"), actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.help_outline,
                  ))),
        ]),
        body: Column(
          children: [
            Question(_question[_index]['question'].toString()),
            ...(_question[_index]['answer'] as List<Map<String, dynamic>>)
                .map((e) {
              return Answer(
                  answer: e['text'],
                  isTrue: e['isture'],
                  addScore: addScore,
                  disbleButton: disableButton,
                  isDisabled: _isDisabled,
                  key: null);
            }).toList(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: _moveButtonDisable ? null : nextQuestion,
                    child: const Text('next'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            )
          ],
        ),
      ),
    );
  }
}
