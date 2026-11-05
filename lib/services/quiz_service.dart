import '../models/question_model.dart';

class QuizService {
  // Get questions based on selected category
  static List<Question> getQuestions(String category) {
    switch (category) {
      // SCIENCE QUESTIONS
      case 'Science':
        return [
          Question(
            question: 'Which planet is known as the Red Planet?',
            options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
            answer: 1,
          ),
          Question(
            question: 'What is the chemical symbol for water?',
            options: ['CO2', 'O2', 'H2O', 'NaCl'],
            answer: 2,
          ),
          Question(
            question: 'Which gas do plants absorb?',
            options: ['Oxygen', 'Carbon dioxide', 'Nitrogen', 'Hydrogen'],
            answer: 1,
          ),
          Question(
            question: 'What is the center of an atom called?',
            options: ['Electron', 'Proton', 'Nucleus', 'Neutron'],
            answer: 2,
          ),
          Question(
            question: 'Which organ pumps blood?',
            options: ['Brain', 'Heart', 'Lungs', 'Kidney'],
            answer: 1,
          ),
        ];

      // MATHEMATICS QUESTIONS
      case 'Mathematics':
        return [
          Question(
            question: 'What is 10 + 15?',
            options: ['20', '25', '30', '35'],
            answer: 1,
          ),
          Question(
            question: 'What is 12 x 5?',
            options: ['50', '55', '60', '65'],
            answer: 2,
          ),
          Question(
            question: 'What is the square root of 64?',
            options: ['6', '7', '8', '9'],
            answer: 2,
          ),
          Question(
            question: 'How many sides does a hexagon have?',
            options: ['5', '6', '7', '8'],
            answer: 1,
          ),
          Question(
            question: 'What is 100 divided by 4?',
            options: ['20', '25', '30', '40'],
            answer: 1,
          ),
        ];

      // COMPUTER QUESTIONS
      case 'Computer':
        return [
          Question(
            question: 'What does CPU stand for?',
            options: [
              'Central Processing Unit',
              'Computer Personal Unit',
              'Central Program Utility',
              'Control Processing User',
            ],
            answer: 0,
          ),
          Question(
            question: 'Which language is used in Flutter?',
            options: ['Java', 'Python', 'Dart', 'C'],
            answer: 2,
          ),
          Question(
            question: 'What does RAM stand for?',
            options: [
              'Read Access Memory',
              'Random Access Memory',
              'Run Active Memory',
              'Real Application Memory',
            ],
            answer: 1,
          ),
          Question(
            question: 'Which is an input device?',
            options: ['Monitor', 'Printer', 'Keyboard', 'Speaker'],
            answer: 2,
          ),
          Question(
            question: 'Which company developed Windows?',
            options: ['Apple', 'Google', 'Microsoft', 'IBM'],
            answer: 2,
          ),
        ];

      // SPORTS QUESTIONS
      case 'Sports':
        return [
          Question(
            question: 'How many players are in a cricket team?',
            options: ['9', '10', '11', '12'],
            answer: 2,
          ),
          Question(
            question: 'How many rings are in the Olympic symbol?',
            options: ['4', '5', '6', '7'],
            answer: 1,
          ),
          Question(
            question: 'Which sport uses a shuttlecock?',
            options: ['Tennis', 'Football', 'Badminton', 'Hockey'],
            answer: 2,
          ),
          Question(
            question: 'How many players are on a football team on the field?',
            options: ['9', '10', '11', '12'],
            answer: 2,
          ),
          Question(
            question: 'Which sport is associated with Wimbledon?',
            options: ['Cricket', 'Tennis', 'Golf', 'Hockey'],
            answer: 1,
          ),
        ];

      // GENERAL KNOWLEDGE QUESTIONS
      case 'General Knowledge':
      default:
        return [
          Question(
            question: 'What is the capital of India?',
            options: ['Mumbai', 'Delhi', 'Chennai', 'Hyderabad'],
            answer: 1,
          ),
          Question(
            question: 'How many days are there in a week?',
            options: ['5', '6', '7', '8'],
            answer: 2,
          ),
          Question(
            question: 'Who is known as the Father of the Nation in India?',
            options: ['Nehru', 'Mahatma Gandhi', 'Patel', 'Bose'],
            answer: 1,
          ),
          Question(
            question: 'Which is the largest ocean?',
            options: ['Indian', 'Atlantic', 'Pacific', 'Arctic'],
            answer: 2,
          ),
          Question(
            question: 'How many sides does a triangle have?',
            options: ['2', '3', '4', '5'],
            answer: 1,
          ),
        ];
    }
  }
}
