import 'package:flutter/material.dart';
import 'quiz_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  String? selectedCategory;

  final List<String> categories = [
    "Dasar Kopi",
    "Manual Brew",
    "Sejarah Kopi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Quiz ☕"),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.wb_sunny : Icons.dark_mode,
            ),
            onPressed: widget.toggleTheme,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Masukkan Nama Kamu:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nama kamu...",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Pilih Kategori Pertanyaan:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedCategory,
              hint: const Text("Pilih kategori"),
              items: categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty || selectedCategory == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Lengkapi nama & kategori dulu!")),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizPage(
                      userName: nameController.text,
                      category: selectedCategory!,
                    ),
                  ),
                );
              },
              child: const Text("Mulai Kuis 🚀"),
            ),
          ],
        ),
      ),
    );
  }
}
