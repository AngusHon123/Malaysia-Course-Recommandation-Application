import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '0.1global_variables.dart';

void main() {
  runApp(AIChatApp());
}

class AIChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [];
  TextEditingController messageController = TextEditingController();
  final apiUrl = "https://api.openai.com/v1/chat/completions";
  final apiKey = "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";

  Future<String> sendMessage(String message) async {
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final data = {
      'messages': [
        {'role': 'user', 'content': 'You are a helpful assistant.'},
        {'role': 'system', 'content': message},
      ],
      'max_tokens': 1,
      'model': 'gpt-3.5-turbo',
    };

    final response = await http.post(Uri.parse(apiUrl),
        headers: headers, body: json.encode(data));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final reply = responseData['choices'][0]['text'].toString().trim();
      return reply;
    } else {
      throw Exception(response.statusCode);
    }
  }

  void addMessage(String message) {
    setState(() {
      messages.add(message);
    });
  }

  void handleSendMessage() async {
    final userMessage = messageController.text;
    messageController.clear();
    addMessage('User: $userMessage');

    try {
      final aiReply = await sendMessage(userMessage);
      addMessage('AI: $aiReply');
    } catch (e) {
      print('Error: $e');

      addMessage('AI: Failed to get a reply from the AI model.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: handleSendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
