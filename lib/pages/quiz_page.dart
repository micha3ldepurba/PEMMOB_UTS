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

  @override
  void initState() {
    super.initState();
    questions = List<Map<String, dynamic>>.from(_allQuestions)
      ..shuffle(Random())
      ..length = 10; // ✅ ambil cuma 10 pertanyaan acak
  }

  void checkAnswer(String selected) {
    final correctAnswer = questions[currentIndex]["answer"];
    final explanation = questions[currentIndex]["description"];

    if (selected == correctAnswer) {
      score++;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "❌ Salah Bos! ${questions[currentIndex]["description"]}",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 3),
        ),
      );
    }

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(
            userName: widget.userName,
            score: score,
            total: questions.length,
          ),
        ),
      );
    }
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
        padding: const EdgeInsets.all(24.0),
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

  // ✅ Semua pertanyaan disini (20 total)
  final List<Map<String, dynamic>> _allQuestions = [
    {
      "question": "Kopi jenis apa yang paling terkenal dari Indonesia?",
      "options": ["Arabika", "Liberika", "Robusta", "Excelsa"],
      "answer": "Arabika",
      "description": "Kopi Arabika dari Indonesia, seperti Gayo dan Toraja, dikenal di seluruh dunia karena cita rasa khasnya."
    },
    {
      "question": "Metode seduh kopi manual yang populer disebut apa?",
      "options": ["Espresso", "Pour Over", "Instant", "Cold Brew"],
      "answer": "Pour Over",
      "description": "Pour over memungkinkan kontrol sempurna terhadap ekstraksi kopi, menghasilkan rasa yang bersih dan halus."
    },
    {
      "question": "Apa efek utama kafein pada tubuh manusia?",
      "options": ["Mengantuk", "Meningkatkan fokus", "Menurunkan energi", "Menyebabkan lapar"],
      "answer": "Meningkatkan fokus",
      "description": "Kafein adalah stimulan alami yang membantu meningkatkan fokus dan kewaspadaan."
    },
    {
      "question": "Apa negara asal minuman kopi?",
      "options": ["Brazil", "Etiopia", "Kolombia", "Yaman"],
      "answer": "Etiopia",
      "description": "Kopi pertama kali ditemukan di Etiopia sebelum menyebar ke Timur Tengah dan seluruh dunia."
    },
    {
      "question": "Apa yang dimaksud dengan 'single origin' pada kopi?",
      "options": ["Campuran berbagai daerah", "Kopi dari satu daerah", "Kopi instan", "Kopi tanpa kafein"],
      "answer": "Kopi dari satu daerah",
      "description": "Single origin berarti biji kopi berasal dari satu daerah atau perkebunan tertentu."
    },
    {
      "question": "Apa fungsi grinder dalam proses penyeduhan kopi?",
      "options": ["Memanaskan air", "Menggiling biji kopi", "Memasak kopi", "Menyaring ampas"],
      "answer": "Menggiling biji kopi",
      "description": "Grinder berfungsi menggiling biji kopi agar ukuran gilingan sesuai metode seduh."
    },
    {
      "question": "Apa itu 'Crema' pada espresso?",
      "options": ["Buih susu", "Lapisan minyak di permukaan", "Bubuk kopi", "Gula karamel"],
      "answer": "Lapisan minyak di permukaan",
      "description": "Crema adalah lapisan busa keemasan hasil tekanan tinggi saat mengekstraksi espresso."
    },
    {
      "question": "Minuman 'Latte' terdiri dari apa saja?",
      "options": ["Espresso dan susu panas", "Kopi hitam dan gula", "Espresso dan air", "Espresso dan es"],
      "answer": "Espresso dan susu panas",
      "description": "Latte dibuat dari espresso yang dicampur dengan susu panas dan sedikit busa di atasnya."
    },
    {
      "question": "Kopi Robusta memiliki karakteristik rasa seperti apa?",
      "options": ["Asam dan lembut", "Pahit dan kuat", "Manis dan ringan", "Asin dan pedas"],
      "answer": "Pahit dan kuat",
      "description": "Robusta mengandung lebih banyak kafein dan memiliki rasa yang lebih pahit dan berat dibanding Arabika."
    },
    {
      "question": "Proses 'Roasting' pada kopi bertujuan untuk apa?",
      "options": ["Mengupas kulit kopi", "Mengeringkan biji kopi", "Mengeluarkan aroma dan rasa kopi", "Menggiling kopi"],
      "answer": "Mengeluarkan aroma dan rasa kopi",
      "description": "Roasting mengubah biji kopi mentah menjadi cokelat dan mengeluarkan aroma khasnya."
    },
    {
      "question": "Apa yang dimaksud dengan 'Cold Brew'?",
      "options": ["Kopi panas yang didinginkan", "Kopi diseduh dengan air dingin lama", "Espresso dengan es", "Kopi instan dingin"],
      "answer": "Kopi diseduh dengan air dingin lama",
      "description": "Cold brew dibuat dengan merendam bubuk kopi dalam air dingin selama 12-24 jam."
    },
    {
      "question": "Kopi ‘Toraja’ berasal dari provinsi mana?",
      "options": ["Sumatera Utara", "Sulawesi Selatan", "Jawa Timur", "Bali"],
      "answer": "Sulawesi Selatan",
      "description": "Kopi Toraja berasal dari daerah pegunungan di Sulawesi Selatan dengan rasa earthy dan spicy."
    },
    {
      "question": "Kopi Luwak terkenal karena apa?",
      "options": ["Proses fermentasi alami", "Harga murah", "Biji terbesar", "Tanpa kafein"],
      "answer": "Proses fermentasi alami",
      "description": "Kopi Luwak dihasilkan dari biji yang dimakan dan dikeluarkan kembali oleh musang luwak, lalu diproses ulang."
    },
    {
      "question": "Alat seduh ‘French Press’ bekerja dengan cara apa?",
      "options": ["Tekanan udara", "Perendaman dan penekanan", "Penyaringan kertas", "Panas tinggi"],
      "answer": "Perendaman dan penekanan",
      "description": "French press merendam kopi dalam air panas, lalu menekan ampas ke bawah dengan saringan logam."
    },
    {
      "question": "Apa arti dari istilah ‘cupping’ dalam dunia kopi?",
      "options": ["Menilai rasa kopi", "Menggiling biji kopi", "Menyeduh espresso", "Menanam kopi"],
      "answer": "Menilai rasa kopi",
      "description": "Cupping adalah metode profesional untuk mencicipi dan menilai profil rasa kopi."
    },
    {
      "question": "Apa perbedaan utama kopi Arabika dan Robusta?",
      "options": ["Warna biji", "Kadar kafein dan rasa", "Cara menanam", "Ukuran cangkir"],
      "answer": "Kadar kafein dan rasa",
      "description": "Arabika lebih asam dan lembut, sedangkan Robusta lebih pahit dan berkafein tinggi."
    },
    {
      "question": "Kopi Gayo berasal dari daerah mana?",
      "options": ["Aceh", "Bali", "Papua", "Sulawesi"],
      "answer": "Aceh",
      "description": "Kopi Gayo berasal dari dataran tinggi Gayo, Aceh, dan dikenal beraroma wangi dan seimbang."
    },
    {
      "question": "Apa itu espresso shot ‘ristretto’?",
      "options": ["Espresso dengan lebih banyak air", "Espresso dengan waktu ekstraksi lebih pendek", "Espresso dingin", "Espresso dengan susu"],
      "answer": "Espresso dengan waktu ekstraksi lebih pendek",
      "description": "Ristretto adalah versi espresso yang lebih pekat karena diekstraksi dalam waktu lebih singkat."
    },
    {
      "question": "Apa yang dimaksud dengan ‘latte art’?",
      "options": ["Menggambar di atas latte dengan susu", "Desain cangkir kopi", "Teknik menggiling kopi", "Pola pada biji kopi"],
      "answer": "Menggambar di atas latte dengan susu",
      "description": "Latte art dibuat dengan menuang susu panas ke espresso untuk membentuk pola estetis."
    },
    {
      "question": "Negara penghasil kopi terbesar di dunia adalah?",
      "options": ["Indonesia", "Brazil", "Kolombia", "Vietnam"],
      "answer": "Brazil",
      "description": "Brazil adalah penghasil kopi terbesar di dunia selama lebih dari 150 tahun."
    },
  ];
}
