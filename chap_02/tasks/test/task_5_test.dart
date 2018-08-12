import 'package:test/test.dart';

import '../task_5.dart';

void main() {
  OrderedArrayTask5 source_one;
  OrderedArrayTask5 source_two;

  setUp(() {
    int maxArraySize = 5;
    source_one = new OrderedArrayTask5(maxArraySize);
    source_two = new OrderedArrayTask5(maxArraySize);

    source_one.insert(59);
    source_one.insert(12);
    source_one.insert(90);
    source_one.insert(45);
    source_one.insert(3);

    source_two.insert(100);
    source_two.insert(7);
    source_two.insert(46);
    source_two.insert(14);
    source_two.insert(17);
  });

  group('OrderedArrayTask5', () {
    test('.merge() should merge two equal length array withoud duplicates', () {
      OrderedArrayTask5 result = OrderedArrayTask5.merge(source_one, source_two);

      expect(result.a, equals([3, 7, 12, 14, 17, 45, 46, 59, 90, 100]));
      expect(result.nElems, equals(10));
    });

    test('.merge() should merge two different lenght array withoud duplicates', () {
      source_one = new OrderedArrayTask5(8);

      source_one.insert(59);
      source_one.insert(12);
      source_one.insert(90);
      source_one.insert(45);
      source_one.insert(3);
      source_one.insert(10);
      source_one.insert(67);
      source_one.insert(38);

      OrderedArrayTask5 result = OrderedArrayTask5.merge(source_one, source_two);

      expect(result.a, equals([3, 7, 10, 12, 14, 17, 38, 45, 46, 59, 67, 90, 100]));
      expect(result.nElems, equals(13));
    });

    test('.merge() should merge two different lenght array with duplicated', () {
      source_one = new OrderedArrayTask5(8);

      source_one.insert(59);
      source_one.insert(12);
      source_one.insert(90);
      source_one.insert(46);
      source_one.insert(7);
      source_one.insert(10);
      source_one.insert(17);
      source_one.insert(38);

      OrderedArrayTask5 result = OrderedArrayTask5.merge(source_one, source_two);
      expect(result.a, equals([7, 7, 10, 12, 14, 17, 17, 38, 46, 46, 59, 90, 100]));
      expect(result.nElems, equals(13));
    });

  });
}
