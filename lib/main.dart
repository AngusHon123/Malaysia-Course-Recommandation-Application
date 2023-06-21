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
  String _name = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNameChanged(String name) {
    setState(() {
      _name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(24.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        /* prefixIcon: Icon(Icons.search), */
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // TODO: 执行搜索操作
                    },
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 28, 17, 107),
        ),
        body: IndexedStack(
          children: [
            Introduction(),
            MyHomePage(),
            /* AIChat() ,*/
          ],
          index: _selectedIndex,
        ),
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
