import 'package:test/test.dart';

import '../high_array.dart';

void main() {
  HighArray highArray;
  setUp(() {
    highArray = new HighArray(10);
    highArray.insert(10);
    highArray.insert(30);
    highArray.insert(25);
    highArray.insert(5);
    highArray.insert(8);
    highArray.insert(90);
    highArray.insert(13);
    highArray.insert(14);
    highArray.insert(7);
  });

  group('HighArray', () {
    test('.find() should return true if element was found', () {
      expect(highArray.find(90), equals(true));
    });

    test('.find() should return false if element was not found', () {
      expect(highArray.find(99), equals(false));
    });

    test('.insert() should insert element and increase array size', () {
      highArray.insert(17);
      expect(highArray.nElems, equals(10));
      expect(highArray.find(17), equals(true));
    });

    test('.delete() should remove element and decreate the array size', () {
      expect(highArray.delete(10), equals(true));
      expect(highArray.nElems, equals(8));
    });

    test('.delete() should return false if element was not find', () {
      expect(highArray.delete(99), equals(false));
      expect(highArray.nElems, equals(9));
    });
  });
}
