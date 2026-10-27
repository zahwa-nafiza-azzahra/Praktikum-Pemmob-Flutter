import 'package:flutter_test/flutter_test.dart';
import 'package:aplikasi_pertama/queue.dart';

void main() {
  group('Pengujian Struktur Data Queue (FIFO)', () {
    late Queue<String> queue;

    setUp(() {
      queue = Queue<String>();
    });

    test('Queue baru diinisialisasi dalam kondisi kosong', () {
      expect(queue.isEmpty, isTrue);
      expect(queue.length, equals(0));
      expect(queue.peek(), isNull);
    });

    test('Enqueue menambahkan elemen ke antrean secara berurutan', () {
      queue.enqueue('Item A');
      queue.enqueue('Item B');

      expect(queue.length, equals(2));
      expect(queue.isEmpty, isFalse);
      expect(queue.peek(), equals('Item A'));
    });

    test('Dequeue menghapus dan mengembalikan elemen pertama yang masuk (FIFO)', () {
      queue.enqueue('Item 1');
      queue.enqueue('Item 2');
      queue.enqueue('Item 3');

      final first = queue.dequeue();
      expect(first, equals('Item 1'));
      expect(queue.length, equals(2));
      expect(queue.peek(), equals('Item 2'));

      final second = queue.dequeue();
      expect(second, equals('Item 2'));
      expect(queue.length, equals(1));
      expect(queue.peek(), equals('Item 3'));
    });

    test('Dequeue pada queue kosong melempar eksepsi StateError', () {
      expect(() => queue.dequeue(), throwsA(isA<StateError>()));
    });

    test('Clear mengosongkan seluruh antrean', () {
      queue.enqueue('Item 1');
      queue.enqueue('Item 2');
      queue.clear();

      expect(queue.isEmpty, isTrue);
      expect(queue.length, equals(0));
    });
  });
}
