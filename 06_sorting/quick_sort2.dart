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
    int size = right - left + 1;
    if (size <= 3) {
      manualSort(left, right);
    } else {
      int median = medianOf3(left, right);
      int partion = partionIt(left, right, median);
      recQuickSort(left, partion - 1);
      recQuickSort(partion + 1, right);
    }
  }

  int medianOf3(int left, int right) {
    int center = (left + right) ~/2;
    if (array[left] > array[center]) {
      swap(left, center);
    }
    if (array[left] > array[right]) {
      swap(left, right);
    }
    if (array[center] > array[right]) {
      swap(center, right);
    }

    swap(center, right - 1);
    return array[right - 1];
  }

  int partionIt(int left, int right, int pivot) {
    int leftPtr = left;
    int rightPtr = right - 1;

    while (true) {
      while (array[++leftPtr] < pivot) {};
      while (array[--rightPtr] > pivot) {};

      if (leftPtr >= rightPtr) {
        break;
      } else {
        swap(leftPtr, rightPtr);
      }
    }
    swap(leftPtr, right - 1);
    return leftPtr;
  }

  void manualSort(int left, int right) {
    int size = right - left + 1;
    if (size <= 1) {
      return;
    }
    if (size == 2 ) {
      if (array[left] > array[right]) {
        swap(left, right);
      }
      return;
    } else {
      if (array[left] > array[right - 1]) {
        swap(left, right - 1);
      }
      if (array[left] > array[right]) {
        swap(left, right);
      }
      if (array[right - 1 ]> array[right]) {
        swap(right - 1, right);
      }
    }
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
