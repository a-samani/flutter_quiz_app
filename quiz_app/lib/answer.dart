import 'package:flutter/material.dart';

import 'helper.dart';

class Answer extends StatefulWidget {
  final bool isTrue;
  final String answer;
  final bool isDisabled;
  final Function disbleButton;
  final Function addScore;

  const Answer({
    Key? key,
    required this.answer,
    this.isTrue = false,
    required this.addScore,
    required this.disbleButton,
    required this.isDisabled,
  }) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  var myColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    if (!AnswerState.isAnswered) {
      myColor = Colors.blue;
    }
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(widget.answer),
        onPressed: widget.isDisabled
            ? null
            : () {
                AnswerState.isAnswered = true;
                if (widget.isTrue) {
                  widget.addScore();
                }

                setState(() {
                  widget.disbleButton();
                  myColor = (widget.isTrue ? Colors.green : Colors.red);
                });
              },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(myColor)),
      ),
    );
  }
}
