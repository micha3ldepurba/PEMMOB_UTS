import 'package:flutter/material.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  final String playerName;
  const QuizPage({super.key, required this.playerName});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Apa ibu kota Indonesia?",
      "options": ["Bandung", "Jakarta", "Surabaya", "Medan"],
      "answer": "Jakarta"
    },
    {
      "question": "Planet terbesar di tata surya?",
      "options": ["Bumi", "Saturnus", "Jupiter", "Mars"],
      "answer": "Jupiter"
    },
    {
      "question": "Siapa pencipta bahasa pemrograman Python?",
      "options": ["Guido van Rossum", "James Gosling", "Elon Musk", "Bill Gates"],
      "answer": "Guido van Rossum"
    },
  ];

  void _checkAnswer(String selected) {
    if (selected == questions[currentQuestion]["answer"]) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultPage(name: widget.playerName, score: score, total: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text("Hai, ${widget.playerName} 👋"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Pertanyaan ${currentQuestion + 1} dari ${questions.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              question["question"],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            ...question["options"].map<Widget>((opt) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: () => _checkAnswer(opt),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(opt, style: const TextStyle(fontSize: 18)),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
