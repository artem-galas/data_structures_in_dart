import 'package:test/test.dart';

import '../task_4.dart';

void main() {
  OrderedArrayTask4 orderedArray;
  setUp(() {
    int maxArraySize = 10;

    orderedArray = new OrderedArrayTask4(maxArraySize);

    // insert 10 elements
    orderedArray.insert(8);
    orderedArray.insert(4);
    orderedArray.insert(10);
    orderedArray.insert(55);
    orderedArray.insert(32);
    orderedArray.insert(18);
    orderedArray.insert(50);
    orderedArray.insert(90);
    orderedArray.insert(14);
    orderedArray.insert(0);
  });

  group('OrderedArrayTask4', () {
    test('.insert() put element in right position', () {
      expect(orderedArray.a, equals([0, 4, 8, 10, 14, 18, 32, 50, 55, 90]));
      expect(orderedArray.nElems, 10);
    });
    test('.delete() remove element by key and return true', () {
      expect(orderedArray.delete(14), equals(true));
      expect(orderedArray.nElems, equals(9));
    });
    test('.delete() return false if element not found', () {
      expect(orderedArray.delete(105), equals(false));
      expect(orderedArray.nElems, equals(10));
    });
  });
}