import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1Assessment.dart';
import '1.1Question.dart';
import 'package:fl_chart/fl_chart.dart';
import './1.4RadarChart.dart';
import './1.5DBHelper.dart';
import './2History.dart';
import '0.3Course.dart';
import "./0.31UMCourse.dart";
import 'package:url_launcher/url_launcher.dart';

class Review extends StatelessWidget {
  final List<String> resultStrings;
  final List<String> categories;
  final List<String> courseRecommand;

  const Review({
    required this.resultStrings,
    required this.categories,
    required this.courseRecommand,
  });

  @override
  Widget build(BuildContext context) {
    List<Course> courseRecommandList = [];
    for (var course in school1Courses) {
      if (courseRecommand[0] == course.courseCode) {
        courseRecommandList.add(course);
      }
      if (courseRecommand[1] == course.courseCode) {
        courseRecommandList.add(course);
      }
    }
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
      body: ListView(
        children: [
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This is your graph'),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [RadarChartWidget(resultStrings: resultStrings)],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your top 3 categories/themes are:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 20),
          for (var category in categories)
            if (category == 'realistic')
              ExpansionTile(
                title: Text(category),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Emotionally stable and patient, they would rather act than talk. Have the ability to operate machinery, like to do things alone and follow the established rules, step by step to manufacture and complete practical objects.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              )
            else if (category == 'investigative')
              ExpansionTile(
                title: Text(category),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Have mathematical ability and the spirit of scientific research, like to observe, research, think, analyze and solve problems, and don\'t like others to give guidance. I also don\'t like having a lot of rules and time pressure at work. When doing things, can come up with new ideas and strategies, but is less interested in the details of actually solving problems. Don\'t care much about other people\'s opinions.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              )
            else if (category == 'artistic')
              ExpansionTile(
                title: Text(category),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Artistic, intuitive, and creative. Like to use imagination and creativity, engage in aesthetic creation, and hope to express creativity and beauty through words, sounds, colors, or forms. Likes to work independently, but also doesn\'t want/like to be ignored, works best in an uninhibited environment.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              )
            else if (category == 'social')
              ExpansionTile(
                title: Text(category),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Kind and easy to get along with people, cares about own and others\' feelings, likes to listen to and understand others, and is willing to devote time and energy to solving other people\'s troubles and helping them grow. Don\'t like competition, but like to work in a team.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              )
            else if (category == 'enterprising')
              ExpansionTile(
                title: Text(category),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Energetic, compact life, adventurous and competitive, have a plan and act immediately. Like to use influence and persuasion to improve unreasonable things. Pursue political or economic achievements, and hope that their performance will be affirmed by others and become the focus of the group.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              )
            else if (category == 'conventional')
              ExpansionTile(
                title: Text(category),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Have agile clerical and computing skills, like to deal with clerical or digital materials. Do things with rules and precision. Likes to work in an environment with clear rules. Their philosophy of life is to play it safe and not like change or innovation, taking risks or leading.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
          SizedBox(height: 20),
          Text(
            'The recommended courses are:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
          Column(
            children: [
              for (var course in courseRecommandList)
                ListTile(
                  title: Text(course.courseName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.courseCode),
                      Text('Entry Points: ${course.entryPoints}'),
                      Text('University: ${course.university}'),
                      Text('Stream: ${course.stream}'),
                    ],
                  ),
                  leading: Icon(Icons.book),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () async {
                    String url =
                        'https://study.um.edu.my/doc/brochures/2022-Syarat-Kemasukan.pdf';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
