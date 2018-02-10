import 'dart:io';

class TowerApp {
  static int nDisck = 3;

  static doTowers(int topN, String from, String inter, String to) {
    if (topN == 1) {
      stdout.writeln('Disk 1 from $from to $to');
    } else {
      doTowers(topN - 1, from, to, inter);
      stdout.writeln('Disk $topN from $from to $to');
      doTowers(topN - 1, inter, from, to);
    }
  }
}

void main(List<String> args) {
  TowerApp.doTowers(TowerApp.nDisck, 'A', 'B', 'C');
}
