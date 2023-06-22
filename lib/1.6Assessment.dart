import 'package:flutter/material.dart';
import 'package:fyp/0.3Course.dart';
import './0.1global_variables.dart';
import './1.1Question.dart';
import './1.2Result.dart';
import './1.3Algorithm.dart';
import './1.4RadarChart.dart';

/* 

class Assessment extends StatefulWidget {
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  List<String> answers = []; // 添加初始化
  int? unansweredQuestionIndex;
  GlobalKey _unansweredCardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // 在 initState 方法中对 answers 进行初始化
    answers = List.filled(questions.length, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Review'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFFeff5ee),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
            final isAnswered = answers[index].isNotEmpty;

            return Card(
              key: index == unansweredQuestionIndex ? _unansweredCardKey : null,
              color: isAnswered ? Colors.white : Colors.red[200],
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
          bool allQuestionsAnswered = true;

          for (int i = 0; i < 2; i++) {
            if (answers[i].isEmpty) {
              allQuestionsAnswered = false;
              unansweredQuestionIndex = i;
              break;
            }
          }

          if (allQuestionsAnswered) {
            List<String> assessmentAnswerByUser = [];
            for (int i = 0; i < questions.length; i++) {
              assessmentAnswerByUser.add('${questions[i].text}: ${answers[i]}');
            }

            List<String> resultStrings =
                calculateValues(answers); //1.3Algorithm
            List<String> assessmentCategories =
                findCategories(resultStrings); //1.3Algorithm
            List<Course> courseRecommandLists =
                findCourseRecommand(assessmentCategories); //1.3Algorithm

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Result(
                  assessmentAnswerByUser: assessmentAnswerByUser,
                  resultStrings: resultStrings,
                  categories: assessmentCategories,
                  courseRecommandLists: courseRecommandLists,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please answer all questions.'),
              ),
            );

            Future.delayed(Duration(milliseconds: 100), () {
              Scrollable.ensureVisible(
                _unansweredCardKey.currentContext!,
                alignment: 0.5,
                duration: Duration(milliseconds: 500),
              );
            });
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
 */
class Assessment extends StatefulWidget {
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  List<String> answers = []; // 添加初始化
  List<bool> isAnswered = [];

  @override
  void initState() {
    super.initState();
    // 在 initState 方法中对 answers 进行初始化
    answers = List.filled(questions.length, '');
    isAnswered = List<bool>.filled(questions.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Review'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 28, 17, 107),
      ),
      backgroundColor: Color(0xFFeff5ee),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
            final cardColor =
                isAnswered[index] ? Color(0xFF4B698F) : Colors.white;

            return Card(
              color: cardColor,
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
                                isAnswered[index] = true;
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
          bool hasUnansweredQuestions = false;

          List<int> questionNoAnswer = [];
          for (int i = 0; i < questions.length; i++) {
            if (answers[i].isEmpty) {
              hasUnansweredQuestions = true;
              isAnswered[i] = false;
              questionNoAnswer.add(i + 1);
            } else {
              isAnswered[i] = true;
            }
          }

          if (hasUnansweredQuestions) {
            /* print(questionNoAnswer[0]); */
            setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please answer questions: ' +
                    questionNoAnswer.join(", ") +
                    '.'), // 字符串拼接
                // 字符串拼接
              ),
            );
          } else {
            List<String> assessmentAnswerByUser = [];
            for (int i = 0; i < questions.length; i++) {
              assessmentAnswerByUser.add('${questions[i].text}: ${answers[i]}');
            }

            List<String> resultStrings =
                calculateValues(answers); //1.3Algorithm
            List<String> assessmentCategories =
                findCategories(resultStrings); //1.3Algorithm
            List<Course> courseRecommandLists =
                findCourseRecommand(assessmentCategories); //1.3Algorithm

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Result(
                  assessmentAnswerByUser: assessmentAnswerByUser,
                  resultStrings: resultStrings,
                  categories: assessmentCategories,
                  courseRecommandLists: courseRecommandLists,
                ),
              ),
            );
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
