import 'dart:io';

int triangle(int number) {
  if (number == 1) {
    return 1;
  } else {
    return (number + triangle(number - 1));
  }
}

void main(List<String> args) {
  stdout.writeln('Enter a number:');
  int number = int.parse(stdin.readLineSync());
  int answer = triangle(number);

  stdout.writeln(answer);
}
