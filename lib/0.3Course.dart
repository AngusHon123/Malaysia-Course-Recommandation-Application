class Course {
  String university;
  String courseCode;
  String courseName;
  String stream;
  String entryPoints;
  String categories1;
  String categories2;

  Course(
      {required this.university,
      required this.courseCode,
      required this.courseName,
      required this.stream,
      required this.entryPoints,
      required this.categories1,
      required this.categories2});

  Map<String, dynamic> toMap() {
    return {
      'university': university,
      'courseCode': courseCode,
      'courseName': courseName,
      'stream': stream,
      'entryPoints': entryPoints,
      'entryPoints': categories1,
      'entryPoints': categories2,
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
      categories1: map['categories1'],
      categories2: map['categories2'],
    );
  }
}
