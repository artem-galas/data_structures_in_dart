import 'package:test/test.dart';

import '../task_2.dart';

void main() {
  HighArrayTask2 array;
  setUp(() {
    array = new HighArrayTask2(10);

    array.insert(10);
    array.insert(44);
    array.insert(30);
    array.insert(22);
    array.insert(88);
    array.insert(94);
    array.insert(2);
    array.insert(66);
    array.insert(3);
    array.insert(99);
  });
  
  group('HightArrayTask2', () {
    test('.removeMax() return and remove max element of array', () {
      expect(array.removeMax(), equals(99));
      expect(array.find(99), equals(false));
      expect(array.nElems, equals(9));
    });
  });
}
