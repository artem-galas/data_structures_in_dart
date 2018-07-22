import 'dart:io';

class ArraySelect {
  List<int> a;
  int nElems;

  ArraySelect(int max) {
    a = new List<int>(max);
    nElems = 0;
  }

  /// Insert new element
  void insert(int value) {
    a[nElems] = value;
    nElems ++;
  }

  /// Display Array contents
  void display() {
    for(int i = 0; i < nElems; i++) {
      stdout.write('${a[i]} ');
    }
    stdout.writeln();
  }

  /// Select Sort Array
  void selectSort() {
    int min;
    for(int out = 0; out < nElems - 1; out ++) {
      min = out;
      for(int _in = out + 1; _in < nElems; _in ++) {
        if(a[_in] < a[min]) {
          min = _in;
        }
      }
      swap(out, min);
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
  ArraySelect array = new ArraySelect(maxSize);

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

  array.selectSort();

  array.display();
}
