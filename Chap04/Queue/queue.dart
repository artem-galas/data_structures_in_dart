import 'dart:io';

class Queue {
  int maxSize;
  List<int> queueArray;
  int front;
  int rear;
  int nItems;

  Queue(int s) {
    maxSize = s;
    queueArray = new List<int>(maxSize);
    front = 0;
    rear = -1;
    nItems = 0;
  }

  /// Put item at rear of queue
  void insert(int item) {
    // Deal with wraparound
    if (rear == maxSize - 1) {
      rear = -1;
    }
    queueArray[++rear] = item; // increment rear and insert
    nItems ++; // one more item
  }

  /// Take item from front of queue
  int remove() {
    // get value and increment front
    int temp = queueArray[front++];
    if(front == maxSize) {
      front = 0;
    }
    nItems --;
    return temp;
  }

  /// Peek at front of queue
  int peekFront() {
    return queueArray[front];
  }
  
  bool isEmpty() {
    return nItems == 0;
  }
  
  bool isFull() {
    return nItems == maxSize;
  }
}

void main() {
  Queue queue = new Queue(5);

  queue.insert(10);
  queue.insert(20);
  queue.insert(30);
  queue.insert(40);

  queue.remove();
  queue.remove();
  queue.remove();

  queue.insert(50);
  queue.insert(60);
  queue.insert(70);
  queue.insert(80);

  while(!queue.isEmpty()) {
    int n = queue.remove();
    stdout.write('$n ');
  }
  stdout.writeln();
}
