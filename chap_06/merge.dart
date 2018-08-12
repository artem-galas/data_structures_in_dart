import 'dart:io';

class MergeApp {
  static void merge(List<int> arrayA, int sizeA, List<int> arrayB, int sizeB, List<int> arrayC ) {
    int aDex = 0, bDex = 0, cDex = 0;
    while (aDex < sizeA && bDex < sizeB) {
      if (arrayA[aDex] < arrayB[bDex]) {
        arrayC[cDex ++] = arrayA[aDex ++];
      } else {
        arrayC[cDex ++] = arrayB[bDex ++];
      }
    }
    while (aDex < sizeA) {
      arrayC[cDex ++] = arrayA[aDex ++];
    }
    while (bDex < sizeB) {
      arrayC[cDex ++] = arrayB[bDex ++];
    }
  }
  static void display(List<int> array, int size) {
    for (int i = 0; i < size; i ++) {
      stdout.write('${array[i]} ');
    }
    stdout.writeln();
  }
}

void main(List<String> args) {
  List<int> arrayA = <int>[23, 47, 81, 95];
  List<int> arrayB = <int>[7, 14, 39, 55, 62, 74];
  List<int> arrayC = new List<int>(10);

  MergeApp.merge(arrayA, arrayA.length, arrayB, arrayB.length, arrayC);
  MergeApp.display(arrayC, 10);
}
