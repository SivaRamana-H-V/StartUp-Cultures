// ignore_for_file: camel_case_types, library_private_types_in_public_api, unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';

class cQuizPage extends StatefulWidget {
  const cQuizPage({super.key});

  @override
  _cQuizPageState createState() => _cQuizPageState();
}

class _cQuizPageState extends State<cQuizPage> {
  int _currentQuestionIndex = 0;
  List<String> _selectedAnswers = List.filled(50, '');
  List<bool> _correctAnswers = List.filled(50, false);
  final List<Question> _questions = [
    Question(
      questionText:
          'Which of the following option leads to the portability and security of Java?',
      options: [
        'Bytecode is executed by JVM',
        'The applet makes the Java code secure and portable',
        'Use of exception handling',
        'Dynamic binding between objects'
      ],
      correctAnswer: 'Bytecode is executed by JVM',
    ),
  ];

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_questions[i].correctAnswer == _selectedAnswers[i]) {
        correctAnswers++;
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Results'),
        content: Text(
          'You got $correctAnswers out of ${_questions.length} correct!',
          style: const TextStyle(color: Color(0xffeca731)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _currentQuestionIndex = 0;
                _selectedAnswers = List.filled(50, '');
                _correctAnswers = List.filled(50, false);
              });
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Flutter Quiz',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffeca731)),
              ),
              const SizedBox(height: 20),
              Text(
                _questions[_currentQuestionIndex].questionText,
                style: const TextStyle(fontSize: 18, color: Color(0xffeca731)),
              ),
              const SizedBox(height: 20),
              ..._questions[_currentQuestionIndex].options.map((option) {
                return RadioListTile<String>(
                  title: Text(
                    option,
                    style: TextStyle(
                      color: _selectedAnswers[_currentQuestionIndex] == option
                          ? (_questions[_currentQuestionIndex].correctAnswer ==
                                  option
                              ? Colors.green
                              : Colors.red)
                          : Colors.black,
                    ),
                  ),
                  value: option,
                  groupValue: _selectedAnswers[_currentQuestionIndex],
                  onChanged: (value) {
                    setState(() {
                      _selectedAnswers[_currentQuestionIndex] = value!;
                      _correctAnswers[_currentQuestionIndex] =
                          _questions[_currentQuestionIndex].correctAnswer ==
                              value;
                    });
                  },
                );
              }).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  // primary: Color(0xffeca731),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(_currentQuestionIndex < _questions.length - 1
                    ? 'Next'
                    : 'Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}
