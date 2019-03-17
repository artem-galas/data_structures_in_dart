import 'dart:io';

class AnagramApp {
  int size;
  int count;
  List<String> arrayChar = new List<String>(100);

  void displayWord() {
    if (count < 99) {
      stdout.write(' ');
    }
    if (count < 9) {
      stdout.write(' ');
    }
    stdout.write('${++count} ');

    for (int i = 0; i < size; i ++) {
      stdout.write(' ${arrayChar[i]}');
    }
    stdout.writeln('  ');
    if (count %6 == 0) {
      stdout.writeln();
    }
  }

  void rotate(int newSize) {
    int i;
    int position = size - newSize;
    String temp = arrayChar[position];
    for (i = position + 1; i < size; i ++) {
      arrayChar[i - 1] = arrayChar[i];
    }
    arrayChar[i - 1] = temp;
  }

  void doAnagram(int newSize) {
    if (newSize == 1) {
      return;
    } else {
      for (int i = 0; i < newSize; i ++) {
        doAnagram(newSize - 1);
        if (newSize == 2) {
          displayWord();
        }
        rotate(newSize);
      }
    }
  }
}

void main(List<String> args) {
  stdout.writeln('Enter a word: ');
  String word = stdin.readLineSync();

  AnagramApp anagramApp = new AnagramApp();

  anagramApp.size = word.length;
  anagramApp.count = 0;
  for (int i = 0; i < anagramApp.size; i ++) {
    anagramApp.arrayChar[i] = word[i];
  }

  anagramApp.doAnagram(anagramApp.size);
}
