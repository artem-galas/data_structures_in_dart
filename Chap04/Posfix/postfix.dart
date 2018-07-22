import 'dart:io';

class StackX {
  int maxSize;
  List<int> stackArray;
  int top;

  StackX(int size) {
    maxSize = size;
    stackArray = new List<int>(maxSize);
    top = -1;
  }

  /// Put item on top of stack
  void push(int item) {
    stackArray[++top] = item;
  }

  /// Take item from top of stack
  int pop() {
    return stackArray[top--];
  }

  /// Peek at top of stack
  int peek() {
    return stackArray[top];
  }

  bool isEmpty() {
    return top == -1;
  }

  int size() {
    return top + 1;
  }

  int peekN(int n) {
    return stackArray[n];
  }

  /// Display Stack Data
  void displayStack(String s) {
    stdout.write(s);
    stdout.write('Stack (bottom -> top): ');
    for(int i = 0; i < size(); i ++) {
      stdout.write('${peekN(i)} ');
    }
    stdout.writeln();
  }
}

class ParsePost {
  StackX stackX;
  String input;

  ParsePost(String s) {
    input = s;
  }

  int doParse() {
    stackX = new StackX(20);
    String char;
    int i;
    int num1, num2;
    int interAns;

    for(i = 0; i < input.length; i++) {
      char = input[i];
      stackX.displayStack('$char ');
      try {
        stackX.push(int.parse(char));
      } catch(error) {
        num2 = stackX.pop();
        num1 = stackX.pop();
        switch(char) {
          case '+':
            interAns = num1 + num2;
            break;
          case '-':
            interAns = num1 - num2;
            break;
          case '*':
            interAns = num1 * num2;
            break;
          case '/':
            interAns = num1 ~/ num2;
            break;
          default:
            interAns = 0;
        }
        stackX.push(interAns);
      }
    }
    interAns = stackX.pop();
    return interAns;
  }
}

void main() {
  stdout.writeln('Enter postfix');
  String input = stdin.readLineSync();
  num output;

  ParsePost parsePost = new ParsePost(input);
  output = parsePost.doParse();
  stdout.writeln('Evalutes to $output');
}
