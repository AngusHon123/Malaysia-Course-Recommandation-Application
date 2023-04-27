/* import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1.2Result.dart';

class History extends StatefulWidget {
  final List<String> categories = [];

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Widget> cardList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Your name is: ${name != null ? name : 'null'}',
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cardList.length,
              itemBuilder: (BuildContext context, int index) {
                return cardList[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:fyp/0.1global_variables.dart';
import './1.2Result.dart';
import './1.5DBHelper.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final dbHelper = DatabaseHelper();
    final data = await dbHelper.getData();
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Your name is: $name',
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                final categories1 = _data[index]['categories1'];
                final categories2 = _data[index]['categories2'];
                final categories3 = _data[index]['categories3'];

                return Card(
                  child: ListTile(
                    title: Text('$categories1, $categories2, $categories3'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
