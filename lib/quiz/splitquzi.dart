// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../courses.dart';
import '../homepage.dart';

int totalScore = 0;

class QuizQuestion {
  final String question;
  final List<String> options;
  int? selectedOption;

  QuizQuestion({
    required this.question,
    required this.options,
    this.selectedOption,
  });
}

class QuizAfterCourse extends StatelessWidget {
  const QuizAfterCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffeca731),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const homePage(),
              ),
            );
          },
        ),
        title: const Text(
          'Courses',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffdfdfd)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/quiz.png'),
          ElevatedButton(
            child: const Text('Take a quiz'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: "What motivates you more?",
    options: [
      "Building something entirely new and innovative",
      "Taking an existing concept and improving it for efficiency",
    ],
  ),
  QuizQuestion(
    question: "How do you handle risk?",
    options: [
      "I'm comfortable with calculated risks and potential for high rewards",
      "I prefer stability and minimize unnecessary risks.",
    ],
  ),
  QuizQuestion(
    question: "How do you react to setbacks?",
    options: [
      "I see them as learning opportunities and quickly Change if needed.",
      "I take time to analyze the problem and develop a corrective plan.",
    ],
  ),
  QuizQuestion(
    question: "What is your preferred work environment?",
    options: [
      "Fast-paced, dynamic, and constantly changing.",
      "Structured, predictable, and results-oriented.",
    ],
  ),
  QuizQuestion(
    question: "How do you approach decision-making?",
    options: [
      "I rely on intuition and adapt based on new data.",
      "I gather information and analyze options before making a decision.",
    ],
  ),
  QuizQuestion(
    question: "Do you crave novelty and innovation?",
    options: [
      "Absolutely! Building something entirely new is exciting.",
      "I value proven concepts, but I'm open to improvements.",
    ],
  ),
  QuizQuestion(
    question: "How do you handle challenges?",
    options: [
      "I see them as opportunities to learn and adapt quickly.",
      "I take time to analyze the problem and develop a solution.",
    ],
  ),
  QuizQuestion(
    question: "What is your ideal work environment?",
    options: [
      "Fast-paced, dynamic, and constantly evolving.",
      "Structured, predictable, and results-oriented.",
    ],
  ),
  QuizQuestion(
    question: "How do you make decisions?",
    options: [
      "I follow my intuition and adapt based on new information.",
      "I gather data and analyze options before making a choice.",
    ],
  ),
  QuizQuestion(
    question:
        "Imagine you have a super cool idea for a new way to help people. What's the first thing you should do?",
    options: [
      "Build a quick example of your idea and show it to people who might use it to see if they like it.",
      "Do some research to find out if other people have this problem and write a long plan about your business.",
    ],
  ),
  QuizQuestion(
    question: "Your company's sales are going down. How can you fix it?",
    options: [
      "Try new ways to advertise and come up with creative ideas to sell more.",
      "Look at your sales numbers to see what's wrong and try to make things run smoother.",
    ],
  ),
  QuizQuestion(
    question:
        "You don't have a lot of money to advertise your product. What should you do?",
    options: [
      "Use free or cheap ways to advertise like social media.",
      "Pay to advertise to the exact people who would want your product and make sure it makes you money.",
    ],
  ),
];

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int currentQuestionIndex = 0;
  late List<String> shuffledOptions = [];

  @override
  void initState() {
    super.initState();
    shuffleOptions();
  }

  void shuffleOptions() {
    setState(() {
      shuffledOptions = List.from(quizQuestions[currentQuestionIndex].options);
      shuffledOptions.shuffle();
    });
  }

  void nextQuestion() {
    int selectedIndex =
        quizQuestions[currentQuestionIndex].selectedOption ?? -1;
    if (selectedIndex == -1) {
      return;
    }

    if (quizQuestions[currentQuestionIndex].options[selectedIndex] ==
        quizQuestions[currentQuestionIndex].options[0]) {
      totalScore++;
    }

    if (currentQuestionIndex < quizQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        shuffleOptions();
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    String resultText;

    if (totalScore >= 7) {
      resultText =
          "Your mindset leans towards a Startup. You thrive in ambiguity, embrace risk, and prioritize innovation.";
    } else if (totalScore >= 4) {
      resultText =
          "Your mindset aligns more with a Business. You value stability, prioritize efficiency, and focus on building upon existing models.";
    } else {
      resultText =
          "This quiz is a starting point. Consider exploring resources on developing an entrepreneurial mindset regardless of your chosen path.";
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Result"),
        content: Text(resultText),
        actions: [
          TextButton(
            onPressed: () {
              if (totalScore < 4) {
                Navigator.of(context).pop();
                setState(() {
                  currentQuestionIndex = 0;
                  totalScore = 0;
                  shuffleOptions();
                });
              } else if (totalScore >= 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => coursesPage(totalScore: totalScore),
                  ),
                );
              }
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        shuffleOptions();
      });
    }
  }

  void selectOption(int index) {
    setState(() {
      quizQuestions[currentQuestionIndex].selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = quizQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  for (int i = 0; i < shuffledOptions.length; i++)
                    GestureDetector(
                      onTap: () => selectOption(i),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentQuestion.selectedOption == i
                              ? Colors.amberAccent
                              : Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${String.fromCharCode(65 + i)}) ",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Expanded(
                              child: Text(
                                shuffledOptions[i],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: currentQuestionIndex > 0
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: previousQuestion,
                    child: const Text("Previous"),
                  ),
                if (currentQuestionIndex < quizQuestions.length - 1)
                  ElevatedButton(
                    onPressed: nextQuestion,
                    child: const Text("Next"),
                  ),
                if (currentQuestionIndex == quizQuestions.length - 1)
                  ElevatedButton(
                    onPressed: nextQuestion,
                    child: const Text("Submit"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
