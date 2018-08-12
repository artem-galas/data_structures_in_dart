/// Add a merge() method to the `OrderedArray` class in the `ordered_array.dart`
/// program so that you can merge two ordered source arrays into an ordered destination array.
/// Write code in main() that inserts some random
/// numbers into the two source arrays, invokes merge(), and displays the contents of the resulting destination array.
/// The source arrays may hold different numbers of data items.
/// In your algorithm you will need to compare the keys of
/// the source arrays, picking the smallest one to copy to the destination.
/// You’ll also need to handle the situation when one source array exhausts its contents before the other.

import 'dart:io';
import 'dart:math';

import '../ordered_array.dart';

class OrderedArrayTask5 extends OrderedArray {

  OrderedArrayTask5(int max)
      : super(max);

  int getValueAt(int index) {
    return a[index];
  }

  void setValueAt(int index, int value) {
    a[index] = value;
  }

  static OrderedArrayTask5 merge(OrderedArrayTask5 source_one, OrderedArrayTask5 source_two) {
    final int length = source_one.size() + source_two.size();

    OrderedArrayTask5 destination = new OrderedArrayTask5(length);

    // initialize indexes for source_one, source_two and destination
    int i = 0, j = 0, k = 0;
    while (i < source_one.size() && j < source_two.size()) {
      if (source_one.getValueAt(i) <= source_two.getValueAt(j)) {
        destination.setValueAt(k, source_one.getValueAt(i));
        i ++;
      } else {
        destination.setValueAt(k, source_two.getValueAt(j));
        j ++;
      }
      destination.nElems ++;
      k ++;
    }

    while (i < source_one.size()) {
      destination.setValueAt(k, source_one.getValueAt(i));
      destination.nElems ++;
      k ++;
      j ++;
      i ++;
    }

    while (j < source_two.size()) {
      destination.setValueAt(k, source_two.getValueAt(j));
      destination.nElems ++;
      k ++;
      j ++;
      i ++;
    }
    return destination;
  }
}

void main() {
  Random random = new Random();

  final int maxArraySize = 10;
  OrderedArrayTask5 source_one = new OrderedArrayTask5(maxArraySize);
  OrderedArrayTask5 source_two = new OrderedArrayTask5(maxArraySize);

  for(int i = 0; i < maxArraySize - 1; i ++) {
    source_one.insert(random.nextInt(100));
    source_two.insert(random.nextInt(100));
  }

  stdout.write('source_one = ');
  source_one.display();
  stdout.write('source_two = ');
  source_two.display();

  OrderedArrayTask5 destination = OrderedArrayTask5.merge(source_one, source_two);

  stdout.write('destination = ');
  destination.display();
}
