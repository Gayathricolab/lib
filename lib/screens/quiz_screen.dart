import 'package:flutter/material.dart';

import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;

  List<Map<String, dynamic>> get questions {
    switch (widget.category) {
      case 'Science':
        return [
          {
            'question': 'Which planet is known as the Red Planet?',
            'options': ['Earth', 'Mars', 'Jupiter', 'Venus'],
            'answer': 1,
          },
          {
            'question': 'What is the chemical symbol for water?',
            'options': ['CO2', 'O2', 'H2O', 'NaCl'],
            'answer': 2,
          },
          {
            'question': 'Which gas do plants absorb?',
            'options': ['Oxygen', 'Carbon dioxide', 'Nitrogen', 'Hydrogen'],
            'answer': 1,
          },
          {
            'question': 'What is the center of an atom called?',
            'options': ['Electron', 'Proton', 'Nucleus', 'Neutron'],
            'answer': 2,
          },
          {
            'question': 'Which organ pumps blood?',
            'options': ['Brain', 'Heart', 'Lungs', 'Kidney'],
            'answer': 1,
          },
        ];

      case 'Mathematics':
        return [
          {
            'question': 'What is 10 + 15?',
            'options': ['20', '25', '30', '35'],
            'answer': 1,
          },
          {
            'question': 'What is 12 x 5?',
            'options': ['50', '55', '60', '65'],
            'answer': 2,
          },
          {
            'question': 'What is the square root of 64?',
            'options': ['6', '7', '8', '9'],
            'answer': 2,
          },
          {
            'question': 'How many sides does a hexagon have?',
            'options': ['5', '6', '7', '8'],
            'answer': 1,
          },
          {
            'question': 'What is 100 divided by 4?',
            'options': ['20', '25', '30', '40'],
            'answer': 1,
          },
        ];

      case 'Computer':
        return [
          {
            'question': 'What does CPU stand for?',
            'options': [
              'Central Processing Unit',
              'Computer Personal Unit',
              'Central Program Utility',
              'Control Processing User',
            ],
            'answer': 0,
          },
          {
            'question': 'Which language is used in Flutter?',
            'options': ['Java', 'Python', 'Dart', 'C'],
            'answer': 2,
          },
          {
            'question': 'What does RAM stand for?',
            'options': [
              'Read Access Memory',
              'Random Access Memory',
              'Run Active Memory',
              'Real Application Memory',
            ],
            'answer': 1,
          },
          {
            'question': 'Which is an input device?',
            'options': ['Monitor', 'Printer', 'Keyboard', 'Speaker'],
            'answer': 2,
          },
          {
            'question': 'Which company developed Windows?',
            'options': ['Apple', 'Google', 'Microsoft', 'IBM'],
            'answer': 2,
          },
        ];

      case 'Sports':
        return [
          {
            'question': 'How many players are in a cricket team?',
            'options': ['9', '10', '11', '12'],
            'answer': 2,
          },
          {
            'question': 'How many rings are in the Olympic symbol?',
            'options': ['4', '5', '6', '7'],
            'answer': 1,
          },
          {
            'question': 'Which sport uses a shuttlecock?',
            'options': ['Tennis', 'Football', 'Badminton', 'Hockey'],
            'answer': 2,
          },
          {
            'question': 'How many players are on a football team on the field?',
            'options': ['9', '10', '11', '12'],
            'answer': 2,
          },
          {
            'question': 'Which sport is associated with Wimbledon?',
            'options': ['Cricket', 'Tennis', 'Golf', 'Hockey'],
            'answer': 1,
          },
        ];

      case 'General Knowledge':
      default:
        return [
          {
            'question': 'What is the capital of India?',
            'options': ['Mumbai', 'Delhi', 'Chennai', 'Hyderabad'],
            'answer': 1,
          },
          {
            'question': 'How many days are there in a week?',
            'options': ['5', '6', '7', '8'],
            'answer': 2,
          },
          {
            'question': 'Who is known as the Father of the Nation in India?',
            'options': ['Nehru', 'Mahatma Gandhi', 'Patel', 'Bose'],
            'answer': 1,
          },
          {
            'question': 'Which is the largest ocean?',
            'options': ['Indian', 'Atlantic', 'Pacific', 'Arctic'],
            'answer': 2,
          },
          {
            'question': 'How many sides does a triangle have?',
            'options': ['2', '3', '4', '5'],
            'answer': 1,
          },
        ];
    }
  }

  void nextQuestion() {
    if (selectedAnswer == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select an answer!')));
      return;
    }

    if (selectedAnswer == questions[currentQuestion]['answer']) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    int total = questions.length;
    int correct = score;
    int wrong = total - correct;
    int finalScore = correct * 10;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: finalScore,
          totalQuestions: total,
          correctAnswers: correct,
          wrongAnswers: wrong,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FC),

      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Text(
              'Question ${currentQuestion + 1} of ${questions.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 15),

            LinearProgressIndicator(
              value: (currentQuestion + 1) / questions.length,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blue,
            ),

            const SizedBox(height: 35),

            const Text(
              'Answer the following question:',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 15),

            Text(
              question['question'],
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            ...List.generate(question['options'].length, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),

                child: ListTile(
                  tileColor: selectedAnswer == index
                      ? Colors.blue.shade100
                      : Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: selectedAnswer == index
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                  ),

                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    child: Text(String.fromCharCode(65 + index)),
                  ),

                  title: Text(question['options'][index]),

                  onTap: () {
                    setState(() {
                      selectedAnswer = index;
                    });
                  },
                ),
              );
            }),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: nextQuestion,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),

                child: Text(
                  currentQuestion == questions.length - 1
                      ? 'Finish Quiz'
                      : 'Next Question',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
