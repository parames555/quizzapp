const String tableQuizz = "Quizz";

class QuizzTable {
  static const String question = "Question";
  static const String answer = "Answer";
  static const String option1 = "Option1";
  static const String option2 = "Option2";
  static const String option3 = "Option3";
  static const String option4 = "Option4";
}

class DbModel {
  String? question;
  String? answer;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  DbModel({
    required this.answer,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  });
  Map<String, Object?> toMap() => {
        QuizzTable.question: question,
        QuizzTable.answer: answer,
        QuizzTable.option1: option1,
        QuizzTable.option2: option2,
        QuizzTable.option3: option3,
        QuizzTable.option4: option4,
      };
}
