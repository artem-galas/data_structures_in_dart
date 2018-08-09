import 'package:test/test.dart';

import '../task_6.dart';

void main() {
  HighArrayTask6 highArrayTask6;

  setUp(() {
    int maxArraySize = 10;
    highArrayTask6 = new HighArrayTask6(maxArraySize);

    highArrayTask6.insert(89);
    highArrayTask6.insert(10);
    highArrayTask6.insert(15);
    highArrayTask6.insert(17);
    highArrayTask6.insert(35);
    highArrayTask6.insert(10);
    highArrayTask6.insert(38);
    highArrayTask6.insert(15);
    highArrayTask6.insert(38);
    highArrayTask6.insert(90);
  });

  group('HighArrayTask6', () {
    test('.noDups() should remove 3 element', () {
      highArrayTask6.noDups();
      expect(highArrayTask6.toString(), equals('89 10 15 17 35 38 90'));
      expect(highArrayTask6.nElems, equals(7));
    });
  });
}
