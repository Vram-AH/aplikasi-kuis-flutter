import 'package:flutter/material.dart';
import './kuis.dart';
import './hasil.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _soalIndex = 0;
  var totalSkor = 0;

  var pertanyaan = [
    {
      'pertanyaan': 'Tempat apa yang akan anda kunjungi?',
      'jawaban': [
        {'teks': 'Pegunungan', 'skor': 10},
        {'teks': 'Pantai', 'skor': 5},
        {'teks': 'Mall', 'skor': 3},
        {'teks': 'Hutan', 'skor': 1},
      ],
    },
    {
      'pertanyaan': 'Apa warna kesukaan anda?',
      'jawaban': [
        {'teks': 'Merah', 'skor': 3},
        {'teks': 'Biru', 'skor': 11},
        {'teks': 'Hijau', 'skor': 5},
        {'teks': 'Hitam', 'skor': 11},
      ],
    },
    {
      'pertanyaan': 'Apa hobi anda?',
      'jawaban': [
        {'teks': 'Sepak Bola', 'skor': 1},
        {'teks': 'Basket', 'skor': 1},
        {'teks': 'Berenang', 'skor': 1},
        {'teks': 'Ngoding', 'skor': 1},
      ],
    },
  ];

  void resetKuis() {
    setState(() {
      _soalIndex = 0;
      totalSkor = 0;
    });
  }

  void _jawaban(int skor) {
    // print('Tombol sudah ditekan');
    totalSkor = totalSkor + skor;
    setState(() {
      _soalIndex += 1;
    });
    if (_soalIndex < pertanyaan.length) {
      print('Masih ada soal berikutnya!');
    } else {
      print('Sudah tidak ada soal!');
    }

    print(_soalIndex);
  }

  // const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Aplikasi Kuis'),
        ),
        body: _soalIndex < pertanyaan.length
            ? Kuis(
                jawaban: _jawaban,
                pertanyaan: pertanyaan,
                soalIndex: _soalIndex,
              )
            : Hasil(totalSkor, resetKuis),
      ),
    );
  }
}
