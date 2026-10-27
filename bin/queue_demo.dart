// ignore_for_file: avoid_print

import 'package:aplikasi_pertama/queue.dart';

/// Program Konsol Dart untuk mendemonstrasikan Class Queue
/// Sesuai materi pada Modul 1:
/// - OOP (Class & Object)
/// - Penambahan & Penghapusan Elemen (enqueue & dequeue)
/// - Penanganan Eksepsi (try - catch)
void main() {
  print('========================================================');
  print('     DEMO IMPLEMENTASI CLASS QUEUE (FIFO) DI DART      ');
  print('========================================================\n');

  // Membuat instance Queue bertipe String
  final queue = Queue<String>();

  print('1. Kondisi Awal:');
  print('   Apakah antrean kosong? ${queue.isEmpty}');
  print('   Jumlah elemen: ${queue.length}\n');

  print('2. Melakukan Operasi enqueue() (Menambah Elemen):');
  final listNama = ['Budi', 'Siti', 'Andi', 'Dewi'];
  for (final nama in listNama) {
    queue.enqueue(nama);
    print('   -> enqueue("$nama") | Isi Antrean: ${queue.toList()}');
  }

  print('\n3. Mengintip Elemen Terdepan dengan peek():');
  print('   Elemen paling depan (head): ${queue.peek()}');
  print('   Jumlah total antrean: ${queue.length}\n');

  print('4. Melakukan Operasi dequeue() (Mengeluarkan Elemen sesuai FIFO):');
  while (queue.isNotEmpty) {
    final keluar = queue.dequeue();
    print('   <- dequeue() mengeluarkan: "$keluar" | Sisa Antrean: ${queue.toList()}');
  }

  print('\n5. Pengujian Penanganan Eksepsi (Exception):');
  print('   Mencoba dequeue() pada antrean yang sudah kosong...');
  try {
    queue.dequeue();
  } catch (e) {
    print('   [Sukses Tertangkap Eksepsi]: $e');
  }

  print('\n========================================================');
  print('                    DEMO SELESAI                        ');
  print('========================================================');
}
