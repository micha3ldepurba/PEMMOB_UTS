import 'package:flutter/material.dart';
import 'home_page.dart';

class ResultPage extends StatelessWidget {
  final String userName;
  final int score;
  final int total;

  const ResultPage({
    super.key,
    required this.userName,
    required this.score,
    required this.total,
  });

  String get resultMessage {
    double percent = (score / total) * 100;
    if (percent == 100) return "Sempurna, ${userName}!";
    if (percent >= 70) return "Keren banget, ${userName}!";
    if (percent >= 40) return "Lumayan, ${userName}! Masih bisa lebih baik!";
    return "Yuk belajar lagi tentang kopi, ${userName}!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Kuis Kopi"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Skor Akhir Kamu",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                "$score / $total",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                resultMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.restart_alt),
                label: const Text("Main Lagi"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
