import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1.1Question.dart';
import './1.2Result.dart';
/* import './2History.dart'; */

class Assessment extends StatefulWidget {
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  String name = 'hhhh';
  String email = 'eeeee';
  String phone = 'ppp';
  String address = 'ppp';

  List<String> answers = []; // 添加初始化

  @override
  void initState() {
    super.initState();
    // 在 initState 方法中对 answers 进行初始化
    answers = List.filled(questions.length, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questions[index].text,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    for (String option in questions[index].options)
                      Row(
                        children: [
                          Radio(
                            value: option,
                            groupValue: answers[index],
                            onChanged: (value) {
                              setState(() {
                                answers[index] = value as String;
                              });
                            },
                          ),
                          Text(option),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<String> assessmentResults = [];
          for (int i = 0; i < questions.length; i++) {
            assessmentResults.add('${questions[i].text}: ${answers[i]}');
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Result(results: assessmentResults)));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}