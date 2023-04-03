import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1.1Question.dart';

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
          print('Name: $name');
          print('Email: $email');
          print('Phone: $phone');
          print('Address: $address');
          for (int i = 0; i < questions.length; i++) {
            print('${questions[i].text}: ${answers[i]}');
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import './0.1global_variables.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Your name is: ${name != null ? name : 'null'}',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}


