import 'package:test/test.dart';

import '../object_sort.dart';

void main() {
  Person person;
  ArrayInObject arrayInObject;

  group('Peson', () {
    test('Person()', () {
      person = Person('lastName', 'firstName', 25);

      expect(person.firstName, 'firstName');
      expect(person.lastName, 'lastName');
      expect(person.age, 25);
    });

    test('.getLastName', () {
      person = Person('lastName', 'firstName', 25);

      expect(person.getLastName(), 'lastName');
    });
  });

  group('ArrayInObject', () {
    setUp(() {
      arrayInObject = ArrayInObject(5);
    });

    group('.insert', () {
      test('should add new element', () {
        arrayInObject.insert('lastName', 'firstName', 25);

        expect(arrayInObject.nElems, equals(1));
        expect(arrayInObject.a[0] is Person, equals(true));
      });
    });

    group('.insertionSort', () {
      setUp(() {
        arrayInObject.insert('Evans', 'Patty', 24);
        arrayInObject.insert('Smith', 'Lorraine', 37);
        arrayInObject.insert('Yee', 'Tom', 43);
        arrayInObject.insert('Adams', 'Henry', 63);

        arrayInObject.insertionSort();

        expect(arrayInObject.a[0].getLastName(), equals('Adams'));
        expect(arrayInObject.a[1].getLastName(), equals('Evans'));
        expect(arrayInObject.a[2].getLastName(), equals('Yee'));
        expect(arrayInObject.a[3].getLastName(), equals('Smith'));
      });
    });
  });
}
