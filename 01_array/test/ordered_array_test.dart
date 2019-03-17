import 'package:test/test.dart';

import '../ordered_array.dart';

void main() {
  OrderedArray orderedArray;
  setUp(() {
    orderedArray = new OrderedArray(10);

    orderedArray.insert(10);
    orderedArray.insert(30);
    orderedArray.insert(3);
    orderedArray.insert(15);
    orderedArray.insert(24);
    orderedArray.insert(99);
    orderedArray.insert(8);
    orderedArray.insert(19);
    orderedArray.insert(70);
  });

  group('OrderedArray', () {
    test('.size() return number of elements in array', () {
      expect(orderedArray.size(), equals(9));
    });

    test('.find() return element index if element was found', () {
      expect(orderedArray.find(15), equals(3));
    });

    test('.find() return nElems if element was not found', () {
      expect(orderedArray.find(99), equals(8));
    });

    test('.insert() put element in right position', () {
      orderedArray.insert(18);
      expect(orderedArray.a, equals([3, 8, 10, 15, 18, 19, 24, 30, 70, 99]));
      expect(orderedArray.nElems, 10);
    });

    test('.delete() remove element by key and return true', () {
      expect(orderedArray.delete(15), equals(true));
      expect(orderedArray.nElems, equals(8));
    });

    test('.delete() return false if element not found', () {
      expect(orderedArray.delete(105), equals(false));
      expect(orderedArray.nElems, equals(9));
    });
  });
}
