import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './0.2test.dart';
import '1Assessment.dart';
import '2History.dart';
import '3AIChat.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return Introduction();
      case 1:
        return MyHomePage();
      /* case 2:
        return AIChat(); */
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 28, 17, 107),
            /* leading: Image.asset(
              'assets/graduation.png', // 请替换为你的图标文件路径
              width: 24.0,
              height: 24.0,
            ), */
            title: Text(
              'UPRecommendation',
              style: TextStyle(fontSize: 24.0), // 调整文本大小
            ),
          ),
        ),
        body: _buildSelectedScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              label: 'Assessment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Result History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'AI Chat',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color.fromARGB(255, 28, 17, 107),
        ),
      ),
    );
  }
}
