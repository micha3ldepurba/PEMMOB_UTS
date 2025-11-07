import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(String) onOptionSelected;

  const QuestionCard({
    super.key,
    required this.question,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color textColor = isDark ? Colors.white : Colors.black;
    final Color buttonColor =
        isDark ? Colors.brown.shade700 : Colors.brown.shade200;
    final Color buttonTextColor =
        isDark ? Colors.white : Colors.brown.shade900;

    return Card(
      elevation: 6,
      color: theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🟤 Pertanyaan
            Text(
              question,
              style: theme.textTheme.titleLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 🟤 Pilihan jawaban
            ...options.map(
              (option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: buttonTextColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 16,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => onOptionSelected(option),
                    child: Text(
                      option,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
