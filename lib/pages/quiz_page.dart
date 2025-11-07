import 'dart:math';
import 'package:flutter/material.dart';
import 'result_page.dart';
import '../widgets/question_card.dart';

class QuizPage extends StatefulWidget {
  final String userName;
  final String category;

  const QuizPage({
    super.key,
    required this.userName,
    required this.category,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int score = 0;
  final List<Map<String, dynamic>> userAnswers = [];
  late final List<Map<String, dynamic>> questions;

  final Map<String, List<Map<String, dynamic>>> quizData = {
    "Dasar Kopi": [
      {
        "question": "Kopi jenis apa yang paling terkenal dari Indonesia?",
        "options": ["Arabika", "Liberika", "Robusta", "Excelsa"],
        "answer": "Arabika",
        "desc":
            "Kopi Arabika banyak dibudidayakan di dataran tinggi Indonesia seperti Gayo, Toraja, dan Kintamani."
      },
      {
        "question": "Kandungan utama dalam kopi yang membuat orang tetap terjaga?",
        "options": ["Klorofil", "Kafein", "Vitamin C", "Protein"],
        "answer": "Kafein",
        "desc":
            "Kafein adalah stimulan alami yang meningkatkan fokus dan mengurangi rasa kantuk."
      },
      {
        "question": "Proses mengubah biji kopi mentah menjadi biji kopi siap seduh disebut?",
        "options": ["Grinding", "Roasting", "Brewing", "Filtering"],
        "answer": "Roasting",
        "desc":
            "Roasting adalah proses pemanggangan biji kopi hijau hingga mengeluarkan aroma dan rasa khas kopi."
      },
      {
        "question": "Negara mana yang dikenal sebagai asal mula kopi?",
        "options": ["Ethiopia", "Brasil", "Yemen", "Kolombia"],
        "answer": "Ethiopia",
        "desc":
            "Legenda menyebutkan kopi pertama kali ditemukan di Ethiopia oleh penggembala kambing bernama Kaldi."
      },
      {
        "question": "Jenis biji kopi yang memiliki rasa lebih kuat dan kadar kafein tinggi adalah?",
        "options": ["Arabika", "Liberika", "Robusta", "Excelsa"],
        "answer": "Robusta",
        "desc":
            "Kopi Robusta lebih pahit dan memiliki lebih banyak kafein daripada Arabika."
      },
      {
        "question": "Suhu ideal air untuk menyeduh kopi adalah sekitar?",
        "options": ["60°C", "70°C", "90–96°C", "100°C"],
        "answer": "90–96°C",
        "desc":
            "Air mendidih (100°C) bisa membuat rasa kopi pahit, jadi suhu ideal sedikit di bawah titik didih."
      },
      {
        "question": "Kopi instan dibuat dari?",
        "options": [
          "Biji kopi mentah",
          "Kopi seduh yang dikeringkan",
          "Kopi bubuk biasa",
          "Biji kakao"
        ],
        "answer": "Kopi seduh yang dikeringkan",
        "desc":
            "Kopi instan dibuat dengan mengeringkan ekstrak kopi seduh agar mudah larut kembali dengan air panas."
      },
      {
        "question": "Kopi Toraja berasal dari pulau?",
        "options": ["Sumatra", "Sulawesi", "Bali", "Kalimantan"],
        "answer": "Sulawesi",
        "desc":
            "Toraja adalah salah satu kopi premium dari Sulawesi dengan cita rasa rempah yang khas."
      },
      {
        "question": "Alat penggiling kopi disebut?",
        "options": ["Filter", "Kettle", "Grinder", "Press"],
        "answer": "Grinder",
        "desc":
            "Grinder digunakan untuk menggiling biji kopi agar sesuai dengan metode seduh yang digunakan."
      },
    ],
    "Manual Brew": [
      {
        "question": "Metode seduh kopi manual yang populer disebut apa?",
        "options": ["Espresso", "Pour Over", "Instant", "Cold Brew"],
        "answer": "Pour Over",
        "desc":
            "Pour Over adalah teknik manual brewing menggunakan alat seperti V60 atau Kalita."
      },
      {
        "question": "French Press menggunakan alat dengan bagian utama berupa?",
        "options": ["Kertas filter", "Logam berpori", "Plunger dan beaker kaca", "Tabung tekanan"],
        "answer": "Plunger dan beaker kaca",
        "desc":
            "French Press menyeduh kopi dengan merendam bubuk kopi lalu menekan plunger untuk memisah ampas."
      },
      {
        "question": "Metode seduh yang menggunakan tekanan udara disebut?",
        "options": ["Chemex", "AeroPress", "Siphon", "Cold Drip"],
        "answer": "AeroPress",
        "desc":
            "AeroPress menggunakan tekanan udara untuk mengekstrak kopi secara cepat dengan rasa bersih dan kuat."
      },
      {
        "question": "Metode manual yang menggunakan dua bejana dan panas api adalah?",
        "options": ["Moka Pot", "Siphon", "Cold Brew", "Drip"],
        "answer": "Siphon",
        "desc":
            "Siphon bekerja dengan tekanan uap air, menghasilkan kopi yang sangat jernih dan kompleks aromanya."
      },
      {
        "question": "Berapa lama waktu ideal menyeduh kopi dengan metode French Press?",
        "options": ["1 menit", "2 menit", "4 menit", "10 menit"],
        "answer": "4 menit",
        "desc":
            "Durasi 4 menit memberikan keseimbangan antara ekstraksi rasa dan kejernihan kopi."
      },
      {
        "question": "Cold Brew dibuat dengan cara?",
        "options": [
          "Air panas diseduh cepat",
          "Air dingin diseduh lama",
          "Air es ditekan",
          "Dipanaskan ulang"
        ],
        "answer": "Air dingin diseduh lama",
        "desc":
            "Cold Brew diseduh selama 8–12 jam menggunakan air dingin, menghasilkan rasa lembut dan rendah asam."
      },
      {
        "question": "Chemex menggunakan filter jenis apa?",
        "options": ["Filter logam", "Filter kertas tebal", "Tanpa filter", "Filter kain"],
        "answer": "Filter kertas tebal",
        "desc": "Filter Chemex lebih tebal dari V60, membuat hasil kopi lebih bersih dan ringan."
      },
    ],
    "Sejarah Kopi": [
      {
        "question": "Siapa yang dipercaya pertama kali menemukan kopi?",
        "options": ["Kaldi", "Marco Polo", "Ras Tafari", "Columbus"],
        "answer": "Kaldi",
        "desc":
            "Legenda menyebutkan penggembala kambing bernama Kaldi menemukan kopi setelah melihat kambingnya berenergi setelah makan buah kopi."
      },
      {
        "question": "Kopi pertama kali dibawa ke Eropa oleh bangsa?",
        "options": ["Arab", "Turki", "Belanda", "Italia"],
        "answer": "Belanda",
        "desc": "Belanda memperkenalkan kopi ke Eropa melalui koloni mereka, termasuk Indonesia."
      },
      {
        "question": "Pulau Jawa dikenal di dunia karena?",
        "options": ["Rempah-rempah", "Kopi Jawa", "Teh hijau", "Susu sapi"],
        "answer": "Kopi Jawa",
        "desc":
            "Istilah 'Java Coffee' bahkan masih digunakan di dunia Barat untuk menyebut kopi."
      },
      {
        "question": "Kapan kopi mulai dibudidayakan di Indonesia?",
        "options": ["Abad ke-17", "Abad ke-18", "Abad ke-19", "Abad ke-20"],
        "answer": "Abad ke-17",
        "desc": "Belanda mulai menanam kopi di Batavia dan Jawa pada abad ke-17."
      },
      {
        "question": "Negara mana yang sekarang menjadi penghasil kopi terbesar dunia?",
        "options": ["Brasil", "Vietnam", "Kolombia", "Indonesia"],
        "answer": "Brasil",
        "desc":
            "Brasil mendominasi produksi kopi dunia dengan ekspor besar dari biji Arabika dan Robusta."
      },
      {
        "question": "Kopi pertama kali diekspor dari Indonesia ke Eropa melalui pelabuhan?",
        "options": ["Batavia", "Surabaya", "Medan", "Makassar"],
        "answer": "Batavia",
        "desc":
            "Batavia (sekarang Jakarta) dulu menjadi pusat perdagangan kopi Asia Tenggara di bawah VOC."
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    final selected = quizData[widget.category] ?? [];
    questions = List<Map<String, dynamic>>.from(selected)..shuffle(Random());
    if (questions.length > 8) {
      questions.removeRange(8, questions.length);
    }
  }

  void checkAnswer(String selected) {
    final current = questions[currentIndex];
    final correct = current["answer"];
    final desc = current["desc"];
    final isCorrect = selected == correct;

    userAnswers.add({
      "question": current["question"],
      "selected": selected,
      "correct": correct,
      "desc": desc,
      "isCorrect": isCorrect,
    });

    if (isCorrect) score++;

    // ✅ Notifikasi benar/salah
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        duration: const Duration(seconds: 1),
        content: Text(
          isCorrect
              ? "Benar! 🎉"
              : "Salah 😢, Jawaban: $correct",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

    Future.delayed(const Duration(milliseconds: 800), () {
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
              questions: questions,
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
      appBar: AppBar(title: Text("Kategori: ${widget.category}")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuestionCard(
              question: q["question"],
              options: List<String>.from(q["options"]),
              onOptionSelected: checkAnswer,
            ),
            const SizedBox(height: 20),
            Text(
              "Pertanyaan ${currentIndex + 1} dari ${questions.length}",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
