import 'dart:io';

class StackX {
  int maxSize;
  List<String> stackArray;
  int top;

  StackX(int size) {
    maxSize = size;
    stackArray = new List<String>(maxSize);
    top = -1;
  }

  /// Put item on top of stack
  void push(String item) {
    stackArray[++top] = item;
  }

  /// Take item from top of stack
  String pop() {
    return stackArray[top--];
  }

  /// Peek at top of stack
  String peek() {
    return stackArray[top];
  }

  bool isEmpty() {
    return top == -1;
  }

  int size() {
    return top + 1;
  }

  String peekN(int n) {
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

class InfixToPostfix {
  StackX stackX;
  String input;
  String output = '';

  InfixToPostfix(String _input) {
    input = _input;
    int stackSize = input.length;
    stackX = new StackX(stackSize);
  }

  /// Do translation to postfix
  String doTranslation() {
    // for each char
    for(int i = 0; i < input.length; i++) {
      String char = input[i]; // get it
      stackX.displayStack('For $char ');
      switch(char) {
        case '+':
        case '-':
          gotOperator(char, 1);
          break;
        case '*':
        case '/':
          gotOperator(char, 2);
          break;
        case '(':
          stackX.push(char);
          break;
        case ')':
          gotParent(char);
          break;
        default:
          output = output + char;
          break;
      }
    }

    while(!stackX.isEmpty()) {
      stackX.displayStack('While ');
      output = output + stackX.pop();
    }
    stackX.displayStack('End ');
    return output;
  }

  void gotOperator(String opThis, int priority) {
    while(!stackX.isEmpty()) {
      String opTop = stackX.pop();
      if(opTop == '(') {
        stackX.push(opTop);
        break;
      } else {
        int prior;
        if(opTop == '+' || opTop == '-') {
          prior = 1;
        } else {
          prior = 2;
        }
        if(prior < priority) {
          stackX.push(opTop);
          break;
        } else {
          output = output + opTop;
        }
      }
    }
    stackX.push(opThis);
  }

  void gotParent(String char) {
    while(!stackX.isEmpty()) {
      String charX = stackX.pop();
      if(charX == '(') {
        break;
      }
      else {
        output = output + charX;
      }
    }
  }
}

void main() {
  String input, output;

  stdout.writeln('Enter infix:');
  input = stdin.readLineSync();

  InfixToPostfix infixToPostfix = new InfixToPostfix(input);

  output = infixToPostfix.doTranslation();

  stdout.writeln('Postfix is $output');
}
