library;

/// Kelas generik [Queue] yang menyimpan elemen dengan urutan FIFO.
class Queue<T> {
  // List privat internal sebagai penyimpanan elemen
  final List<T> _items = [];

  /// Method [enqueue]: Menambahkan elemen baru ke bagian belakang antrean (rear/tail).
  void enqueue(T element) {
    _items.add(element);
  }

  /// Method [dequeue]: Menghapus dan mengembalikan elemen paling depan (front/head).
  /// Melempar [StateError] jika antrean kosong (penerapan konsep penanganan Exception).
  T dequeue() {
    if (isEmpty) {
      throw StateError('Gagal melakukan dequeue: Antrean masih kosong!');
    }
    return _items.removeAt(0);
  }

  /// Method [peek]: Melihat elemen paling depan tanpa menghapusnya.
  /// Mengembalikan `null` jika antrean kosong.
  T? peek() {
    if (isEmpty) {
      return null;
    }
    return _items.first;
  }

  /// Memeriksa apakah antrean dalam keadaan kosong.
  bool get isEmpty => _items.isEmpty;

  /// Memeriksa apakah antrean memiliki isi.
  bool get isNotEmpty => _items.isNotEmpty;

  /// Mendapatkan jumlah elemen di dalam antrean saat ini.
  int get length => _items.length;

  /// Mengosongkan seluruh antrean.
  void clear() {
    _items.clear();
  }

  /// Mengambil salinan elemen antrean dalam bentuk list tidak dapat diubah (unmodifiable list).
  List<T> toList() {
    return List.unmodifiable(_items);
  }

  @override
  String toString() => _items.toString();
}
