import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String userName;
  final int score;
  final int total;
  final List<Map<String, dynamic>> userAnswers;

  const ResultPage({
    super.key,
    required this.userName,
    required this.score,
    required this.total,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Kuis ☕"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Selamat, $userName!",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Skor kamu: $score / $total",
              style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: userAnswers.length,
                itemBuilder: (context, index) {
                  final ans = userAnswers[index];
                  return Card(
                    color: ans["isCorrect"] ? Colors.green[50] : Colors.red[50],
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q${index + 1}: ${ans["question"]}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Jawaban kamu: ${ans["selected"]}",
                            style: TextStyle(
                              color: ans["isCorrect"]
                                  ? Colors.green
                                  : Colors.redAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text("Jawaban benar: ${ans["correct"]}"),
                          const SizedBox(height: 4),
                          Text(
                            ans["description"],
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Main Lagi 🔁"),
            )
          ],
        ),
      ),
    );
  }
}
