import 'dart:io';
import 'dart:math';

class ArrayIns {
  List<int> array;
  int numberOfElements;

  ArrayIns(int max) {
    array = new List<int>(max);
    numberOfElements = 0;
  }

  void insert(int value) {
    array[numberOfElements] = value;
    numberOfElements++;
  }

  void display() {
    stdout.write('A = ');
    for (int i = 0; i < numberOfElements; i++) {
      stdout.write('${array[i]} ');
    }
    stdout.writeln();
  }

  void quickSort() {
    recQuickSort(0, numberOfElements - 1);
  }

  void recQuickSort(int left, int right) {
    if (right - left <= 0) {
      return;
    } else {
      int pivot = array[right];
      int partion = partionIt(left, right, pivot);
      recQuickSort(left, partion - 1);
      recQuickSort(partion + 1, right);
    }
  }

  int partionIt(int left, int right, int pivot) {
    int leftPtr = left - 1;
    int rightPtr = right;

    while (true) {
      while (array[++leftPtr] < pivot) {};
      while (rightPtr > 0 && array[--rightPtr] > pivot) {};

      if (leftPtr >= rightPtr) {
        break;
      } else {
        swap(leftPtr, rightPtr);
      }
    }
    swap(leftPtr, right);
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
  Random random = new Random();
  ArrayIns arrayIns = new ArrayIns(maxSize);
  for (int i = 0; i < maxSize; i++) {
    int value = random.nextInt(100);
    arrayIns.insert(value);
  }

  arrayIns.display();
  arrayIns.quickSort();
  arrayIns.display();
}
