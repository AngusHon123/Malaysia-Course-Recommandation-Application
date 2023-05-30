import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1Assessment.dart';
import '1.1Question.dart';
import 'package:fl_chart/fl_chart.dart';
import './1.4RadarChart.dart';
import './1.5DBHelper.dart';
import './2History.dart';
import '0.3Course.dart';

import 'package:url_launcher/url_launcher.dart';

class Result extends StatelessWidget {
  final List<String> assessmentAnswerByUser;
  final List<String> resultStrings;
  final List<String> categories;
  final List<Course> courseRecommandLists;

  const Result(
      {required this.assessmentAnswerByUser,
      required this.resultStrings,
      required this.categories,
      required this.courseRecommandLists});

  @override
  Widget build(BuildContext context) {
    String resultText = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment Results'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await DBHelper.insert('mytable', {
                'name': categories[0],
                'age': '32',
                'reaslisticString': resultStrings[0] = '2'.toString(),
                'investigativeString': resultStrings[1] = '3'.toString(),
                'artisticString': resultStrings[2] = '4'.toString(),
                'socialString': resultStrings[3] = '5'.toString(),
                'enterprisingString': resultStrings[4] = '6'.toString(),
                'conventionalString': resultStrings[5] = '7'.toString(),
                'categories1': categories[0],
                'categories2': categories[1],
                'categories3': categories[2],
              });
              final snackBar = SnackBar(content: Text('Saved'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              await Future.delayed(Duration(seconds: 1));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadarChartWidget(resultStrings: resultStrings),
              ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var category in categories)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Chip(
                    label: Text(category),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
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
          Column(
            children: [
              for (var course in courseRecommandLists)
                ListTile(
                  title: Text(course.courseName),
                  subtitle: Text(course.courseCode),
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
