import 'dart:io';
import 'dart:math';

class ArraySh {
  List<int> array;
  int nElems;

  ArraySh(int max) {
    array = new List<int>(max);
    nElems = 0;
  }

  void insert(int value) {
    array[nElems] = value;
    nElems++;
  }

  void display() {
    stdout.write('A = ');
    for (int i = 0; i < nElems; i++) {
      stdout.write('${array[i]} ');
    }
    stdout.writeln();
  }

  void shellSort() {
    int inner, outer;
    int temp;
    int h = 1;
    while (h <= nElems / 3) {
      h = h * 3 + 1;
    }

    while (h > 0) {
      for (outer = h; outer < nElems; outer++) {
        temp = array[outer];
        inner = outer;
        while (inner > h - 1 && array[inner - h] >= temp) {
          array[inner] = array[inner - h];
          inner -= h;
        }
        array[inner] = temp;
      }
      h = (h - 1) ~/ 3;
    }
  }
}

void main() {
  int maxSize = 10;
  ArraySh arraySh = new ArraySh(maxSize);
  Random random = new Random();
  for (int i = 0; i < maxSize; i++) {
    int n = random.nextInt(100);
    arraySh.insert(n);
  }
  arraySh.display();
  arraySh.shellSort();
  arraySh.display();
}
