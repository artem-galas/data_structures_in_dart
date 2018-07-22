import 'dart:io';

class StackX {
  int maxSize;
  List<int> stackArray;
  int top;

  StackX(int s) {
    maxSize = s;
    stackArray = new List<int>(maxSize);
    top = -1;
  }

  void push(int p) {
    stackArray[++top] = p;
  }

  int pop() {
    return stackArray[top--];
  }

  int peek() {
    return stackArray[top];
  }

  bool isEmpty() {
    return top == -1;
  }
}

class StackTriangleApp {
  static int number;
  static int answer;
  static StackX stackX;

  static void stackTriangle() {
    stackX = new StackX(10000);
		answer = 0;
    while (number > 0) {
			stackX.push(number);
			-- number;
    }
		while (!stackX.isEmpty()) {
			int newN = stackX.pop();
			answer += newN;
		}
  }
}


void main() {
  stdout.write('Enter a number: ');
  StackTriangleApp.number = int.parse(stdin.readLineSync());
  StackTriangleApp.stackTriangle();
  stdout.writeln('Triangle = ${StackTriangleApp.answer}');
}

