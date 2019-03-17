import 'dart:io';
import 'dart:math';

class ArrayPart {
  List<int> array;
  int nElems;

  ArrayPart(int max) {
    array = new List<int>(max);
    nElems = 0;
  }

  void insert(int value) {
    array[nElems] = value;
    nElems++;
  }

  int size() {
    return nElems;
  }

  void display() {
    stdout.write('A = ');
    for (int i = 0; i < nElems; i++) {
      stdout.write('${array[i]} ');
    }
    stdout.writeln();
  }

  int partion(int left, int right, int pivot) {
    int leftPtr = left - 1;
    int rightPtr = right + 1;

    while (true) {
      while (leftPtr < right && array[++leftPtr] < pivot) {};
      while (rightPtr > left && array[--rightPtr] > pivot) {};

      if (leftPtr >= rightPtr) {
        break;
      } else {
        swap(leftPtr, rightPtr);
      }
    }
    return leftPtr;    
  }

  void swap(int dex1, int dex2) {
    int temp;
    temp = array[dex1];
    array[dex1] = array[dex2];
    array[dex2] = temp;
  }
}

void main() {
  int maxSize = 16;
  ArrayPart arrayPart = new ArrayPart(maxSize);
  Random random = new Random();
  for (int i = 0; i < maxSize; i++) {
    int n = random.nextInt(200);
    arrayPart.insert(n);
  }
  arrayPart.display();

  int pivot = 99;
  stdout.write('Pivot is $pivot');
  int size = arrayPart.size();

  int partDex = arrayPart.partion(0, size - 1, pivot);

  stdout.writeln(', Partion is at index $partDex');
  arrayPart.display();
}