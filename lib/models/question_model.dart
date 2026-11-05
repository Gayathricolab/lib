class Question {
  final String question;
  final List<String> options;
  final int answer;

  Question({
    required this.question,
    required this.options,
    required this.answer,
  });

  // Convert Map data into Question object
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'],
      options: List<String>.from(map['options']),
      answer: map['answer'],
    );
  }

  // Convert Question object into Map data
  Map<String, dynamic> toMap() {
    return {'question': question, 'options': options, 'answer': answer};
  }

  // Check whether the selected answer is correct
  bool isCorrect(int selectedAnswer) {
    return selectedAnswer == answer;
  }
}
