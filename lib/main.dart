// ignore_for_file: avoid_print

import 'dart:io';
import 'queue.dart';

/// Fungsi utama (entry point) aplikasi Queue berbasis terminal / konsol.
void main() {
  final queue = Queue<String>();
  bool berjalan = true;

  print('==================================================');
  print('        PROGRAM STRUKTUR DATA QUEUE (FIFO)        ');
  print('        Praktikum Pemrograman Mobile - Dart       ');
  print('==================================================');

  while (berjalan) {
    _tampilkanStatusAntrean(queue);
    _tampilkanMenu();

    stdout.write('Pilih menu [0-6]: ');
    final input = stdin.readLineSync();

    // Jika input null (misal saat EOF / terminal tertutup)
    if (input == null) {
      print('\n[Info] Sesi terminal selesai.');
      break;
    }

    final pilihan = input.trim();
    print(''); // Spasi baris

    switch (pilihan) {
      case '1':
        _handleEnqueue(queue);
        break;
      case '2':
        _handleDequeue(queue);
        break;
      case '3':
        _handlePeek(queue);
        break;
      case '4':
        _handleTampilkan(queue);
        break;
      case '5':
        _handleClear(queue);
        break;
      case '6':
        _jalankanDemoOtomatis(queue);
        break;
      case '0':
        print('Terima kasih telah menggunakan program Queue ini. Sampai jumpa!');
        berjalan = false;
        break;
      default:
        print('[Peringatan] Pilihan tidak valid! Silakan masukkan angka 0 - 6.');
    }

    if (berjalan) {
      print('\n==================================================');
    }
  }
}

/// Menampilkan status ringkas antrean dan visualisasi FIFO saat ini
void _tampilkanStatusAntrean(Queue<String> queue) {
  print('\n[STATUS ANTREAN]');
  print('• Total Elemen : ${queue.length}');
  print('• Kondisi      : ${queue.isEmpty ? "Kosong" : "Terisi"}');
  print('• Terdepan     : ${queue.peek() ?? "-"}');

  if (queue.isNotEmpty) {
    final list = queue.toList();
    print('• Visualisasi  : [FRONT] ${list.join(" -> ")} [REAR]');
  } else {
    print('• Visualisasi  : (Antrean Kosong)');
  }
  print('--------------------------------------------------');
}

/// Menampilkan daftar menu interaktif
void _tampilkanMenu() {
  print('PILIHAN OPERASI:');
  print('1. Enqueue (Tambah elemen ke antrean)');
  print('2. Dequeue (Ambil elemen paling depan)');
  print('3. Peek    (Lihat elemen terdepan)');
  print('4. Tampilkan Seluruh Isi Antrean');
  print('5. Kosongkan Antrean (Clear)');
  print('6. Jalankan Demo Otomatis');
  print('0. Keluar');
  print('--------------------------------------------------');
}

/// Operasi penambahan elemen ke antrean
void _handleEnqueue(Queue<String> queue) {
  stdout.write('Masukkan nama atau nilai data: ');
  final data = stdin.readLineSync()?.trim();

  if (data == null || data.isEmpty) {
    print('[Peringatan] Input tidak boleh kosong!');
    return;
  }

  queue.enqueue(data);
  print('[SUKSES ENQUEUE] Elemen "$data" berhasil masuk ke antrean (rear).');
}

/// Operasi pengambilan elemen terdepan dengan penanganan eksepsi (try - catch)
void _handleDequeue(Queue<String> queue) {
  try {
    final elemen = queue.dequeue();
    print('[SUKSES DEQUEUE] Elemen "$elemen" keluar dari antrean (front).');
  } catch (e) {
    // Penanganan eksepsi StateError saat antrean kosong
    print('[EKSEPSI TERTANGKAP] $e');
  }
}

/// Operasi melihat elemen terdepan tanpa menghapusnya
void _handlePeek(Queue<String> queue) {
  final elemen = queue.peek();
  if (elemen != null) {
    print('[PEEK] Elemen terdepan (head) saat ini: "$elemen"');
  } else {
    print('[PEEK] Antrean masih kosong, tidak ada elemen untuk diintip.');
  }
}

/// Menampilkan detail indeks dari depan ke belakang
void _handleTampilkan(Queue<String> queue) {
  if (queue.isEmpty) {
    print('[INFO] Antrean kosong.');
    return;
  }

  final items = queue.toList();
  print('[DAFTAR ANTREAN - Urutan FIFO (${queue.length} elemen)]:');
  for (int i = 0; i < items.length; i++) {
    final posisi = i == 0
        ? ' <-- [FRONT/DEPAN]'
        : (i == items.length - 1 ? ' <-- [REAR/BELAKANG]' : '');
    print('  ${i + 1}. ${items[i]}$posisi');
  }
}

/// Mengosongkan antrean
void _handleClear(Queue<String> queue) {
  if (queue.isEmpty) {
    print('[INFO] Antrean sudah dalam keadaan kosong.');
    return;
  }

  queue.clear();
  print('[SUKSES] Antrean telah berhasil dikosongkan.');
}

/// Menjalankan demonstrasi alur FIFO secara otomatis
void _jalankanDemoOtomatis(Queue<String> queue) {
  print('>>> MEMULAI DEMO OTOMATIS QUEUE (FIFO) <<<');

  print('\n1. Membersihkan antrean...');
  queue.clear();

  print('2. Melakukan Enqueue 4 Elemen:');
  final sampleData = ['Budi', 'Siti', 'Andi', 'Dewi'];
  for (final item in sampleData) {
    queue.enqueue(item);
    print('   -> enqueue("$item") | Isi Antrean: ${queue.toList()}');
  }

  print('\n3. Mengintip Elemen Depan (Peek):');
  print('   Elemen terdepan: "${queue.peek()}"');

  print('\n4. Mengeluarkan Elemen secara FIFO (Dequeue):');
  while (queue.isNotEmpty) {
    final keluar = queue.dequeue();
    print('   <- dequeue(): "$keluar" | Sisa Antrean: ${queue.toList()}');
  }

  print('\n5. Pengujian Exception Handling (Dequeue saat kosong):');
  print('   Mencoba queue.dequeue()...');
  try {
    queue.dequeue();
  } catch (e) {
    print('   [Sukses Tangkap Exception]: $e');
  }

  print('\n>>> DEMO OTOMATIS SELESAI <<<');
}
