import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String userName;
  final int score;
  final int total;
  final List<Map<String, dynamic>> userAnswers;
  final List<Map<String, dynamic>> questions;

  const ResultPage({
    super.key,
    required this.userName,
    required this.score,
    required this.total,
    required this.userAnswers,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hai $userName!",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Skor kamu: $score / $total",
                style: const TextStyle(fontSize: 20)),
            const Divider(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: userAnswers.length,
                itemBuilder: (context, index) {
                  final ans = userAnswers[index];
                  return Card(
                    color: ans["isCorrect"]
                        ? Colors.green[100]
                        : Colors.red[100],
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(ans["question"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jawabanmu: ${ans["selected"]}"),
                          Text("Benar: ${ans["correct"]}"),
                          Text(ans["desc"]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
