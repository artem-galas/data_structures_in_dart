import 'dart:io';

class PowerApp {
  static int power(int x, int y) {
    stdout.writeln('X = $x; Y = $y');
    if (y != 1) {
      x = power(x*x, y~/2);
    }
    return x;
  }
}

void main() {
  stdout.write('Enter X ');
  int x = int.parse(stdin.readLineSync());
  stdout.write('Enter Y ');
  int y = int.parse(stdin.readLineSync());
  int answer = PowerApp.power(x, y);
  stdout.writeln(answer);
}