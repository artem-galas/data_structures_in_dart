import 'package:test/test.dart';

import '../insert_sort.dart';

void main() {
  ArrayInsert arrayInsert;

  group('ArrayInsert', () {
    setUp(() {
       arrayInsert = ArrayInsert(5);
    });

    group('.insert', () {
      test('should add new element', () {
        arrayInsert.insert(4);

        expect(arrayInsert.nElems, equals(1));
      });
    });

    group('.insertSort', () {
      setUp(() {
        arrayInsert.insert(4);
        arrayInsert.insert(6);
        arrayInsert.insert(2);
        arrayInsert.insert(3);
        arrayInsert.insert(9);
      });

      test('should sort elements', () {
        arrayInsert.insertSort();

        expect(arrayInsert.a, equals([2, 3, 4, 6, 9]));
      });
    });
  });
}
