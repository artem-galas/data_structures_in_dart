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

class Reverser {
  String input;
  String output;

  Reverser(String _input) {
    input = _input;
  }

  String doReverse() {
    int stackSize = input.length;
    StackString stack = new StackString(stackSize);

    for(int i = 0; i < stackSize; i++) {
      String char = input[i];
      stack.push(char);
    }
    output = '';
    while(!stack.isEmpty()) {
      String char = stack.pop();
      output = output + char;
    }
    return output;
  }
}

void main() {
  String input, output;

  stdout.writeln('Enter a string: ');
  input = stdin.readLineSync();

  Reverser reverser = new Reverser(input);
  output = reverser.doReverse();

  stdout.writeln('Reversed: $output');
}
