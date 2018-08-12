import 'package:test/test.dart';

import '../task_3.dart';

void main() {
  HighArrayTask3 array;
  HighArrayTask3 orderedArray;
  setUp(() {
    int maxArraySize = 10;

    array = new HighArrayTask3(maxArraySize);

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


    orderedArray = new HighArrayTask3(maxArraySize);
  });
  
  group('HightArrayTask3', () {
    test('.removeMax() for build new array sorted array', () {

      int length = array.nElems;
      for(int i = 0; i < length; i++) {
        int item = array.removeMax();
        orderedArray.insert(item);
      }

      expect(orderedArray.a, equals([99, 94, 88, 66, 44, 30, 22, 10, 3, 2]));
    });
  });
}
