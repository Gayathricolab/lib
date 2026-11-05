import 'package:flutter/foundation.dart';

import '../models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  // Quiz variables
  String category = '';

  List<Question> questions = [];

  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswer;

  bool isFinished = false;

  // Get current question
  Question get currentQuestion {
    return questions[currentQuestionIndex];
  }

  // Get total questions
  int get totalQuestions {
    return questions.length;
  }

  // Get wrong answers
  int get wrongAnswers {
    return totalQuestions - score;
  }

  // Start a new quiz
  void startQuiz(String selectedCategory, List<Question> quizQuestions) {
    category = selectedCategory;
    questions = quizQuestions;

    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;
    isFinished = false;

    notifyListeners();
  }

  // Select an answer
  void selectAnswer(int answerIndex) {
    if (isFinished || selectedAnswer != null) return;

    selectedAnswer = answerIndex;
    notifyListeners();
  }

  // Check whether the answer is correct
  bool checkAnswer() {
    if (selectedAnswer == null || questions.isEmpty) {
      return false;
    }

    return currentQuestion.isCorrect(selectedAnswer!);
  }

  // Move to the next question
  bool nextQuestion() {
    if (selectedAnswer == null || questions.isEmpty) {
      return false;
    }

    if (isFinished) return true;

    if (checkAnswer()) {
      score++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      selectedAnswer = null;
      notifyListeners();
      return false;
    } else {
      isFinished = true;
      notifyListeners();
      return true;
    }
  }

  // Reset quiz
  void resetQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;
    isFinished = false;

    notifyListeners();
  }
}
