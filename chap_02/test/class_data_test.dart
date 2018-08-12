import 'package:test/test.dart';

import '../class_data.dart';

void main() {
  DataArray dataArray;
  setUp(() {
    dataArray = new DataArray(5);

    dataArray.insert('Borvo', 'the Hutt', 24);
    dataArray.insert('Darth', 'Vader', 47);
    dataArray.insert('Bail', 'Organa', 32);
    dataArray.insert('Sheev', 'Palpatine', 90);
  });

  group('DataArray', () {
    test('.find() return Peson by lastName', () {
      expect(dataArray.find('Darth'), equals(isNotNull));
    });

    test('.find() return null if Person was not found', () {
      expect(dataArray.find('Yoda'), equals(isNull));
    });

    test('.insert() put new element to array', () {
      dataArray.insert('Bobba', 'Fett', 32);
      expect(dataArray.nElems, equals(5));
    });

    test('.delete() remove and return true if element was found', () {
      expect(dataArray.delete('Darth'), equals(isTrue));
      expect(dataArray.nElems, equals(3));
    });

    test('.delete() remove and return false if element was not found', () {
      expect(dataArray.delete('Yoda'), equals(isFalse));
      expect(dataArray.nElems, equals(4));
    });
  });
}
