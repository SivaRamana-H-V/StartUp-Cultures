// ignore_for_file: camel_case_types, library_private_types_in_public_api, prefer_final_fields, unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';

class javaQuizPage extends StatefulWidget {
  const javaQuizPage({super.key});

  @override
  _javaQuizPageState createState() => _javaQuizPageState();
}

class _javaQuizPageState extends State<javaQuizPage> {
  int _currentQuestionIndex = 0;
  List<String> _selectedAnswers = List.filled(50, '');
  List<bool> _correctAnswers = List.filled(50, false);
  List<Question> _questions = [
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
    Question(
      questionText: 'Which of the following is not a Java feature?',
      options: [
        'Dynamic',
        'Architecture Neutral',
        'Use of pointers',
        'Object-oriented'
      ],
      correctAnswer: 'Use of pointers',
    ),
    Question(
      questionText: 'Which of the following is a valid declaration of a char?',
      options: [
        'char ch = \'\\utea\';',
        'char ca = \'tea\';',
        'char cr = \'\\u0223\';',
        'char cc = \'\\itea\';'
      ],
      correctAnswer: 'char ch = \'\\utea\';',
    ),
    Question(
      questionText:
          'Evaluate the following Java expression, if x=3, y=5, and z=10:\n++z + y - y + z + x++',
      options: ['24', '23', '20', '25'],
      correctAnswer: '25',
    ),
    Question(
      questionText: 'Which of the following for loop declaration is not valid?',
      options: [
        'for (int i = 99; i >= 0; i / 9)',
        'for (int i = 7; i <= 77; i += 7)',
        'for (int i = 20; i >= 2; --i)',
        'for (int i = 2; i <= 20; i = 2 * i)'
      ],
      correctAnswer: 'for (int i = 99; i >= 0; i / 9)',
    ),
    Question(
      questionText:
          'In which process, a local variable has the same name as one of the instance variables?',
      options: [
        'Serialization',
        'Variable Shadowing',
        'Abstraction',
        'Multi-threading'
      ],
      correctAnswer: 'Variable Shadowing',
    ),
    Question(
      questionText:
          'Which of the following is true about the anonymous inner class?',
      options: [
        'It has only methods',
        'Objects can\'t be created',
        'It has a fixed class name',
        'It has no class name'
      ],
      correctAnswer: 'It has no class name',
    ),
    Question(
      questionText:
          'An interface with no fields or methods is known as a ______.',
      options: [
        'Runnable Interface',
        'Marker Interface',
        'Abstract Interface',
        'CharSequence Interface'
      ],
      correctAnswer: 'Marker Interface',
    ),
    Question(
      questionText:
          'Which of the following is an immediate subclass of the Panel class?',
      options: ['Applet class', 'Window class', 'Frame class', 'Dialog class'],
      correctAnswer: 'Applet class',
    ),
    Question(
      questionText:
          'Which of these classes are the direct subclasses of the Throwable class?',
      options: [
        'RuntimeException and Error class',
        'Exception and VirtualMachineError class',
        'Error and Exception class',
        'IOException and VirtualMachineError class'
      ],
      correctAnswer: 'Error and Exception class',
    ),
    // Add more questions here up to 50
    // ... Add remaining questions
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
