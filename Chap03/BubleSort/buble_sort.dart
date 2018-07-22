import 'dart:io';

class ArrayBub {
  List<int> a;
  int nElems;

  ArrayBub(int max) {
    a = new List<int>(max);
    nElems = 0;
  }

  /// Insert Data
  void insert(int value) {
    a[nElems] = value;
    nElems ++;
  }

  /// Display Data
  void display() {
    for(int i = 0; i < nElems; i++) {
      stdout.write('${a[i]} ');
    }
    stdout.writeln();
  }

  /// Bubble Array Sort
  void bubbleSort() {
    for(int out = nElems - 1; out > 1; out --) {
      for(int _in = 0; _in < out; _in ++) {
        if(a[_in] > a[_in +1 ]) {
          swap(_in, _in + 1);
        }
      }
    }
  }

  /// Swap elements
  void swap(int one, int two) {
    int temp = a[one];
    a[one] = a[two];
    a[two] = temp;
  }
}

void main() {
  int maxSize = 100;
  ArrayBub array = new ArrayBub(maxSize);

  // Insert 10 items
  array.insert(77);
  array.insert(99);
  array.insert(44);
  array.insert(55);
  array.insert(22);
  array.insert(88);
  array.insert(11);
  array.insert(00);
  array.insert(66);
  array.insert(33);

  array.display();

  array.bubbleSort();

  array.display();
}
