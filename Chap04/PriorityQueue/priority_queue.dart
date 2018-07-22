import 'dart:io';

class PriorityQueue {
  int maxSize;
  List<int> queueArray;
  int nItems;

  PriorityQueue(int s) {
    maxSize = s;
    queueArray = new List<int>(maxSize);
    nItems = 0;
  }

  /// Insert Data to Queue
  void insert(int item) {
    int j;
    if (nItems == 0) {
      queueArray[nItems++] = item;
    } else {
      for(j = nItems - 1; j >= 0; j --) {
        if(item > queueArray[j]) {
          queueArray[j + 1] = queueArray[j];
        } else {
          break;
        }
      }
      queueArray[j+1] = item;
      nItems ++;
    }
  }

  /// Remove data
  int remove() {
    return queueArray[--nItems];
  }

  int peekMin() {
    return queueArray[nItems - 1];
  }

  bool isEmpty() {
    return nItems == 0;
  }

  bool isFull() {
    return nItems == maxSize;
  }
}

void main() {
  PriorityQueue priorityQueue = new PriorityQueue(5);
  priorityQueue.insert(30);
  priorityQueue.insert(50);
  priorityQueue.insert(10);
  priorityQueue.insert(40);
  priorityQueue.insert(20);

  while(!priorityQueue.isEmpty()) {
    int item = priorityQueue.remove();
    stdout.write('$item ');
  }
}
