import 'dart:io';

class OrderedArray {
  List<int> a;
  int nElems;

  OrderedArray(int max) {
    a = new List<int>(max);
    nElems = 0;
  }

  int size() {
    return nElems;
  }

  int find(int searchKey) {
    return _recursionFind(searchKey, 0, nElems - 1);
  }

  int _recursionFind(int searchKey, int lowerBound, int upperBound) {
    int curIn;
    curIn = (lowerBound + upperBound) ~/ 2;
    if (a[curIn] == searchKey){
      return curIn;
    } else if (lowerBound > upperBound) {
      return nElems;
    } else {
      if (a[curIn] < searchKey) {
        return _recursionFind(searchKey, curIn + 1, upperBound);
      } else {
        return _recursionFind(searchKey, lowerBound, curIn - 1 );
      }
    }
  }

  void insert(int value) {
    int j;
    for (j = 0; j < nElems; j ++) {
      if (a[j] > value) {
        break;
      }
    }
    for (int k = nElems; k > j; k --) {
      a[k] = a[k - 1];
    }
    a[j] = value;
    nElems ++;
  }

  void display() {
    for (int i = 0; i < nElems; i ++){
      stdout.write('${a[i]} ');
    }
    stdout.writeln();
  }
}

void main(List<String> args) {
  int maxSize = 100;
  OrderedArray orderedArray = new OrderedArray(maxSize);
  orderedArray.insert(72);
  orderedArray.insert(90);
  orderedArray.insert(45);
  orderedArray.insert(126);
  orderedArray.insert(54);
  orderedArray.insert(99);
  orderedArray.insert(144);
  orderedArray.insert(27);
  orderedArray.insert(135);
  orderedArray.insert(81);
  orderedArray.insert(18);
  orderedArray.insert(108);
  orderedArray.insert(9);
  orderedArray.insert(117);
  orderedArray.insert(63);
  orderedArray.insert(36);

  orderedArray.display();

  int searchKey = 27;

  if (orderedArray.find(searchKey) != orderedArray.size()) {
    stdout.writeln('Found $searchKey');
  } else {
    stdout.writeln("Can't find $searchKey");
  }
}
