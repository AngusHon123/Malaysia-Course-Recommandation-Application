class Question {
  final String text;
  final List<String> options;

  Question({required this.text, required this.options});
}

final List<Question> questions = [
  Question(text: 'Are you optimistic?', options: ['Yes', 'No']),
  Question(text: 'Have you been happy lately?', options: ['Yes', 'No']),
  Question(text: 'Do you have any hobbies?', options: ['Yes', 'No']),
  Question(text: 'Are you single?', options: ['Yes', 'No']),
];
