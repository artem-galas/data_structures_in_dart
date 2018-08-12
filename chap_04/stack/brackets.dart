import 'dart:io';

class StackString {
  int maxSize;
  List<String> stackArray;
  int top;

  StackString(int s) {
    maxSize = s;
    stackArray = new List<String>(s);
    top = -1;
  }

  void push(String j) {
    stackArray[++top] = j;
  }

  String pop() {
    return stackArray[top--];
  }

  String peek() {
    return stackArray[top];
  }

  bool isEmpty() {
    return (top == -1);
  }

  bool isFull() {
    return (top == maxSize - 1);
  }
}

class BracketChecker {
  String input;

  BracketChecker(String _input) {
    input = _input;
  }

  /// Check if all brackets are closed
  void check() {
    int stackSize = input.length;
    StackString stack = new StackString(stackSize);

    for(int i = 0; i < stackSize; i ++) {
      String char = input[i];
      switch(char) {
        case '{':
        case '[':
        case '(':
          stack.push(char);
          break;
        case '}':
        case ']':
        case ')':
          if(!stack.isEmpty()) {
            String charx = stack.pop();
            if((charx != '{' && char == '}') ||
               (charx != '[' && char == ']') ||
               (charx != '(' && char == ')')) {
              stdout.writeln('Error $char at $i');
            }
          } else {
            stdout.writeln('Error $char at $i');
          }
          break;
        default:
          break;
      }
    }
    if(!stack.isEmpty()) {
      stdout.writeln('Error: missing right delimeter');
    }
  }
}

void main() {
  stdout.writeln('Enter a string: ');
  String input = stdin.readLineSync();

  BracketChecker bracketChecker = new BracketChecker(input);
  bracketChecker.check();

}
