import 'package:test/test.dart';

import '../low_array.dart';

void main() {
  LowArray lowArray;
  setUp(() {
    lowArray = new LowArray(10);
  });

  group('LowArray', () {
    test('.setElement() should create element on index', () {
      lowArray.setElement(0, 5);
      expect(lowArray.a[0], equals(5));
    });

    test('.getElement() should return element by index', () {
      lowArray.a[0] = 5;
      expect(lowArray.getElement(0), equals(5));
    });
  });

}
