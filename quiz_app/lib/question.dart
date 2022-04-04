import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String s;
  const Question(this.s, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 250,
        width: double.infinity,
        child: Card(
            child: Center(
                child: Text(
              s,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            elevation: 20,
            color: Colors.cyan.shade100),
      ),
    );
  }
}
