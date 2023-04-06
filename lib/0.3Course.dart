class Course {
  String university;
  String courseCode;
  String courseName;
  String stream;
  String entryPoints;

  Course({
    required this.university,
    required this.courseCode,
    required this.courseName,
    required this.stream,
    required this.entryPoints,
  });

  Map<String, dynamic> toMap() {
    return {
      'university': university,
      'courseCode': courseCode,
      'courseName': courseName,
      'stream': stream,
      'entryPoints': entryPoints,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    final entryPoints = map['entryPoints'].split('-');
    final minPoints = int.parse(entryPoints[0]);
    final maxPoints = int.parse(entryPoints[1]);
    return Course(
      university: map['university'],
      courseCode: map['courseCode'],
      courseName: map['courseName'],
      stream: map['stream'],
      entryPoints: map['entryPoints'],
    );
  }
}
