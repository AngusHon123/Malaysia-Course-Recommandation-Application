import './1.5dbHelper.dart';
import 'package:flutter/material.dart';
import './2.1Review.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> _dataList = [];
  List<String> yourResultStringsArray = [];
  List<String> yourAssessmentCategoriesArray = [];
  List<String> courseRecommandArray = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final dataList = await DBHelper.getData('mytable');
    setState(() {
      _dataList = dataList;
    });
  }

  Future<void> _deleteData(int id) async {
    await DBHelper.deleteData('mytable', id);
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _dataList.length,
              itemBuilder: (context, index) {
                final data = _dataList[index];

                return InkWell(
                  onTap: () {
                    // 处理点击事件
                    print('Card tapped! ${data['name']}');
                    print('id:${data['id']}');
                    print(data['reaslisticString']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Review(
                          resultStrings: yourResultStringsArray = [
                            data['reaslisticString'].toString(),
                            data['investigativeString'].toString(),
                            data['artisticString'].toString(),
                            data['socialString'].toString(),
                            data['enterprisingString'].toString(),
                            data['conventionalString'].toString(),
                          ],
                          categories: yourAssessmentCategoriesArray = [
                            data['categories1'],
                            data['categories2'],
                            data['categories3'],
                          ],
                          courseRecommand: courseRecommandArray = [
                            data['courseRecommand1'],
                            data['courseRecommand2'],
                          ],
                        ),
                      ),
                    );
                  },
                  splashColor: Colors.blue, // 水波纹颜色
                  highlightColor: Colors.green, // 高亮颜色
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'categories: ${data['name']}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'categoriesString: ${data['artisticString']}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteData(data['id']),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
