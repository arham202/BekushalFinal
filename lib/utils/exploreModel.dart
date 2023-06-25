class Course {
  final String courseName;
  final List topics;

  Course({
    required this.topics,
    required this.courseName,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json["CourseName"],
      topics: json["Topics"].map<Topics>((item){
        return Topics.fromJson(item);
      }).toList(),
    );
  }
}

class Topics {
  final String topicName;
  final String searchTerms;
  final String quizCode;
  final List<String> syllabus;

  Topics({required this.searchTerms,required this.topicName, required this.syllabus, required this.quizCode});

  Topics.copy(Topics other)
      : topicName = other.topicName,
        searchTerms = other.searchTerms,
        quizCode = other.quizCode,
        syllabus = other.syllabus;

  factory Topics.fromJson(Map<String, dynamic> json) {
    return Topics(
      topicName: json["TopicName"],
      searchTerms: json["SearchTerms"],
      quizCode: json["QuizCode"],
      syllabus: json["Syllabus"].map<String>((e) =>  e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "TopicName": topicName,
        "SearchTerms": searchTerms,
        "Syllabus": syllabus,
        "QuizCode": quizCode
      };
}