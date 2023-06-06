import 'package:flutter/material.dart';
import 'package:fyp/0.3Course.dart';
import './0.1global_variables.dart';
import './1.1Question.dart';
import './1.2Result.dart';
import './1.3Algorithm.dart';
import './1.4RadarChart.dart';

class Assessment extends StatefulWidget {
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
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
      backgroundColor: Color(0xFFeff5ee),
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
          List<String> assessmentAnswerByUser = [];
          for (int i = 0; i < questions.length; i++) {
            assessmentAnswerByUser.add('${questions[i].text}: ${answers[i]}');
          }

          List<String> resultStrings = calculateValues(answers); //1.3Algorithm
          List<String> assessmentCategories =
              findCategories(resultStrings); //1.3Algorithm
          List<Course> courseRecommandLists =
              findCourseRecommand(assessmentCategories);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Result(
                        assessmentAnswerByUser: assessmentAnswerByUser,
                        resultStrings: resultStrings,
                        categories: assessmentCategories,
                        courseRecommandLists: courseRecommandLists,
                      )));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
