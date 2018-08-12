import 'dart:io';

class Params {
  int n;
  int returnAddress;

  Params(this.n, this.returnAddress){}
}

class StackX {
  int maxSize;
  List<Params> stackArray;
  int top;

  StackX(int s) {
    maxSize = s;
    stackArray = new List<Params>(maxSize);
    top = -1;
  }

  void push(Params p) {
    stackArray[++top] = p;
  }

  Params pop() {
    return stackArray[top--];
  }

  Params peek() {
    return stackArray[top];
  }
}

class StackTriangleApp {
  static int number;
  static int answer;
  static StackX stackX;
  static int codePart;
  static Params params;

  static void recTriangle() {
    stackX = new StackX(10000);
    codePart = 1;
    while (step() == false) {

    }
  }

  static bool step() {
    switch (codePart) {
      case 1:
        params = new Params(number, 6);
        stackX.push(params);
        codePart = 2;
        break;
      case 2:
        params = stackX.peek();
        if (params.n == 1) {
          answer = 1;
          codePart = 5;
        } else {
          codePart = 3;
        }
        break;
      case 3:
        params = new Params(params.n - 1, 4);
        stackX.push(params);
        codePart = 2;
        break;
      case 4:
        params = stackX.peek();
        answer = answer + params.n;
        codePart = 5;
        break;
      case 5:
        params = stackX.peek();
        codePart = params.returnAddress;
        stackX.pop();
        break; 
      case 6:
        return true;  
    }
    return false;
  }

}


void main() {
  stdout.write('Enter a number: ');
  StackTriangleApp.number = int.parse(stdin.readLineSync());
  StackTriangleApp.recTriangle();
  stdout.writeln('Triangle = ${StackTriangleApp.answer}');
}

