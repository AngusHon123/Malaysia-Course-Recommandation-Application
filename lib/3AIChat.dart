import 'package:flutter/material.dart';
import './0.1global_variables.dart';

class AIChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPR',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'UPR',
                style: TextStyle(
                  fontSize: 80.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'University Course Recommendation',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'This app helps you find the best courses for your university education.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
