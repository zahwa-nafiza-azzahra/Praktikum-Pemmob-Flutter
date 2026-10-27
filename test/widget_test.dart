import 'package:flutter_test/flutter_test.dart';
import 'package:aplikasi_pertama/queue.dart';

void main() {
  test('Pengujian antrean Queue untuk integrasi aplikasi terminal', () {
    final queue = Queue<String>();

    expect(queue.isEmpty, isTrue);

    queue.enqueue('Item 1');
    queue.enqueue('Item 2');
    expect(queue.length, 2);
    expect(queue.peek(), 'Item 1');

    final dequeued = queue.dequeue();
    expect(dequeued, 'Item 1');
    expect(queue.length, 1);
    expect(queue.peek(), 'Item 2');
  });
}
