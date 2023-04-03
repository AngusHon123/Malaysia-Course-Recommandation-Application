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
