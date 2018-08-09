import 'package:test/test.dart';

import '../task_1.dart';

void main() {
  HighArrayTask1 array;
  setUp(() {
    array = new HighArrayTask1(10);

    array.insert(10);
    array.insert(44);
    array.insert(30);
    array.insert(22);
    array.insert(88);
    array.insert(99);
    array.insert(94);
    array.insert(2);
    array.insert(66);
    array.insert(3);
  });
  
  group('HightArrayTask1', () {
    test('.getMax() return max element of array', () {
      expect(array.getMax(), equals(99));
    });
  });
}
