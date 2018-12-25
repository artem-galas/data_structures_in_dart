import 'package:test/test.dart';

import '../select_sort.dart';

void main() {
  ArraySelect arraySelect;

  setUp(() {
    arraySelect = ArraySelect(5);
  });

  group(('ArraySelect'), () {
    group('.insert', () {
      test('should add new element', () {
        arraySelect.insert(4);

        expect(arraySelect.nElems, equals(1));
      });
    });

    group('.selectSort', () {
      setUp(() {
        arraySelect.insert(4);
        arraySelect.insert(6);
        arraySelect.insert(2);
        arraySelect.insert(3);
        arraySelect.insert(9);
      });

      test('should sort array', () {
        arraySelect.selectSort();

        expect(arraySelect.a, equals([2, 3, 4, 6, 9]));
      });

      test('.swap should swap items', () {
        arraySelect.swap(0, 1);

        expect(arraySelect.a, equals([6, 4, 2, 3, 9]));
      });
    });
  });
}
