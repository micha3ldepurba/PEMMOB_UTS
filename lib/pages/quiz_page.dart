import 'dart:math';
import 'package:flutter/material.dart';
import 'result_page.dart';
import '../widgets/question_card.dart';

class QuizPage extends StatefulWidget {
  final String userName;
  const QuizPage({super.key, required this.userName});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int score = 0;

  late final List<Map<String, dynamic>> questions;
  final List<Map<String, dynamic>> userAnswers = [];

  final List<Map<String, dynamic>> _allQuestions = [
    {
      "question": "Kopi jenis apa yang paling terkenal dari Indonesia?",
      "options": ["Arabika", "Liberika", "Robusta", "Excelsa"],
      "answer": "Arabika",
      "description":
          "Kopi Arabika dikenal sebagai kopi unggulan dari Indonesia dengan cita rasa lembut dan sedikit asam."
    },
    {
      "question": "Metode seduh kopi manual yang populer disebut apa?",
      "options": ["Espresso", "Pour Over", "Instant", "Cold Brew"],
      "answer": "Pour Over",
      "description":
          "Pour Over adalah metode manual brewing dengan menuangkan air panas perlahan di atas bubuk kopi."
    },
    {
      "question": "Apa efek utama kafein pada tubuh manusia?",
      "options": [
        "Mengantuk",
        "Meningkatkan fokus",
        "Menurunkan energi",
        "Menyebabkan lapar"
      ],
      "answer": "Meningkatkan fokus",
      "description":
          "Kafein bekerja sebagai stimulan yang membantu meningkatkan fokus dan kewaspadaan."
    },
    {
      "question": "Apa yang dimaksud dengan single origin coffee?",
      "options": [
        "Campuran berbagai biji kopi",
        "Kopi dari satu daerah tertentu",
        "Kopi tanpa kafein",
        "Kopi yang dicampur susu"
      ],
      "answer": "Kopi dari satu daerah tertentu",
      "description":
          "Single origin artinya biji kopi berasal dari satu lokasi atau perkebunan tertentu."
    },
    {
      "question": "Proses pemanggangan biji kopi disebut?",
      "options": ["Grinding", "Roasting", "Brewing", "Filtering"],
      "answer": "Roasting",
      "description":
          "Roasting adalah proses pemanggangan biji kopi mentah untuk mengeluarkan aroma dan rasa khasnya."
    },
    {
      "question": "Alat seduh berbentuk kerucut dengan filter disebut?",
      "options": ["French Press", "V60", "Moka Pot", "AeroPress"],
      "answer": "V60",
      "description":
          "V60 adalah alat pour-over berbentuk kerucut yang populer digunakan untuk menyeduh kopi manual."
    },
    {
      "question": "Espresso berasal dari negara mana?",
      "options": ["Brasil", "Italia", "Ethiopia", "Peru"],
      "answer": "Italia",
      "description":
          "Espresso berasal dari Italia dan menjadi dasar dari berbagai minuman kopi modern."
    },
    {
      "question": "Apa perbedaan utama antara latte dan cappuccino?",
      "options": ["Jumlah susu dan busa", "Jenis biji kopi", "Suhu air", "Cara penyajian"],
      "answer": "Jumlah susu dan busa",
      "description":
          "Latte memiliki lebih banyak susu dan lebih sedikit busa dibanding cappuccino."
    },
    {
      "question": "Kopi luwak terkenal karena apa?",
      "options": [
        "Rasa pahitnya",
        "Proses fermentasi alami oleh luwak",
        "Asal dari Bali",
        "Diseduh dengan susu kambing"
      ],
      "answer": "Proses fermentasi alami oleh luwak",
      "description":
          "Kopi luwak berasal dari biji kopi yang dimakan dan dikeluarkan kembali oleh luwak, memberikan rasa khas."
    },
    {
      "question": "Cold brew dibuat dengan cara apa?",
      "options": [
        "Menggunakan air panas",
        "Diseduh dengan air dingin lama",
        "Dicampur soda",
        "Diseduh dengan es batu langsung"
      ],
      "answer": "Diseduh dengan air dingin lama",
      "description":
          "Cold brew dibuat dengan merendam bubuk kopi dalam air dingin selama 8–24 jam."
    },
    {
      "question": "Apa fungsi utama dari tamper dalam pembuatan espresso?",
      "options": ["Menekan bubuk kopi", "Menyaring air", "Mengatur suhu", "Membuat busa"],
      "answer": "Menekan bubuk kopi",
      "description":
          "Tamper digunakan untuk memadatkan bubuk kopi di portafilter agar ekstraksi lebih merata."
    },
    {
      "question": "Negara penghasil kopi terbesar di dunia adalah?",
      "options": ["Brasil", "Kolombia", "Indonesia", "Vietnam"],
      "answer": "Brasil",
      "description":
          "Brasil dikenal sebagai produsen kopi terbesar di dunia karena iklim dan lahan yang ideal."
    },
    {
      "question": "Robusta memiliki kadar kafein lebih ... dari Arabika?",
      "options": ["Tinggi", "Rendah", "Sama", "Tidak tentu"],
      "answer": "Tinggi",
      "description":
          "Kopi Robusta mengandung kafein hampir dua kali lipat lebih banyak dari Arabika."
    },
    {
      "question": "Kopi decaf berarti apa?",
      "options": ["Tanpa kafein", "Kopi dingin", "Kopi susu", "Kopi hitam pekat"],
      "answer": "Tanpa kafein",
      "description":
          "Decaf coffee telah melewati proses pengurangan kadar kafein hingga hampir nol."
    },
    {
      "question": "Kopi dari Gayo terkenal karena?",
      "options": [
        "Aromanya kuat dan asam seimbang",
        "Pahit ekstrem",
        "Dingin saat disajikan",
        "Rasanya hambar"
      ],
      "answer": "Aromanya kuat dan asam seimbang",
      "description":
          "Kopi Gayo dari Aceh dikenal karena aroma kuat, keasaman seimbang, dan body yang halus."
    },
  ];

  @override
  void initState() {
    super.initState();
    questions = List<Map<String, dynamic>>.from(_allQuestions)
      ..shuffle(Random())
      ..length = 10;
  }

  void checkAnswer(String selected) {
    final correct = questions[currentIndex]["answer"];
    final desc = questions[currentIndex]["description"];
    final isCorrect = selected == correct;

    userAnswers.add({
      "question": questions[currentIndex]["question"],
      "selected": selected,
      "correct": correct,
      "isCorrect": isCorrect,
      "description": desc,
    });

    if (isCorrect) {
      score++;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ Benar! $desc")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Salah! $desc")),
      );
    }

    Future.delayed(const Duration(seconds: 2), () {
      if (currentIndex < questions.length - 1) {
        setState(() => currentIndex++);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultPage(
              userName: widget.userName,
              score: score,
              total: questions.length,
              userAnswers: userAnswers,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo, ${widget.userName}! ☕"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuestionCard(
              question: q["question"],
              options: q["options"],
              onOptionSelected: checkAnswer,
            ),
            const SizedBox(height: 30),
            Text(
              "Pertanyaan ${currentIndex + 1} dari ${questions.length}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
