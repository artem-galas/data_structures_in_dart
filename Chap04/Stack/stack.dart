import 'dart:io';

class StackX {
  int maxSize;
  List<int> stackArray;
  int top;

  StackX(int s) {
    maxSize = s;
    stackArray = new List<int>(s);
    top = -1;
  }

  void push(int j) {
    stackArray[++top] = j;
  }

  int pop() {
    return stackArray[top--];
  }

  int peek() {
    return stackArray[top];
  }

  bool isEmpty() {
    return (top == -1);
  }

  bool isFull() {
    return (top == maxSize - 1);
  }
}

void main() {
  StackX stack = new StackX(10);
  stack.push(20);
  stack.push(40);
  stack.push(60);
  stack.push(80);

  while(!stack.isEmpty()) {
    int value = stack.pop();
    stdout.write('$value ');
  }
  stdout.writeln();
}
