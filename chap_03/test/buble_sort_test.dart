import 'package:test/test.dart';

import '../buble_sort.dart';

void main() {
  ArrayBub arrayBub;

  setUp(() {
    arrayBub = ArrayBub(5);
  });

  group('ArrayBub', () {
    group('.insert', () {
      test('should add new element', () {
        arrayBub.insert(4);

        expect(arrayBub.nElems, equals(1));
      });
    });

    group('.bubleSort', () {
      setUp(() {
        arrayBub.insert(4);
        arrayBub.insert(6);
        arrayBub.insert(2);
        arrayBub.insert(3);
        arrayBub.insert(9);
      });
      test('should sort array', () {
        arrayBub.bubbleSort();

        expect(arrayBub.a, equals([2, 3, 4, 6, 9]));
      });

      test('.swap should swap items', () {
        arrayBub.swap(0, 1);

        expect(arrayBub.a, equals([6, 4, 2, 3, 9]));
      });
    });
  });
}