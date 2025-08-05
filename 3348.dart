import 'dart:io';

void main() {
  var n = int.parse(stdin.readLineSync()!);
  int k = n;
  bool ganhou = false;
  while (!ganhou) {
    bool eliminated = false;
    int index = 0;
    List<int> spiders = [];

    for (int i = 1; i < (n * 2) + 1; i++) {
      spiders.add(i);
    }

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < k; j++) {
        if (index >= n * 2) {
          index = 0;
        }
        if (spiders[index] == -1) {
          index++;
          j--;
        } else {
          if (j == k - 1) {
            if (index < n) {
              eliminated = true;
            }
            spiders[index] = -1;
            index++;
          } else if (index < n * 2) {
            index++;
          }
          if (index >= n * 2) {
            index = 0;
          }
        }
      }
    }

    if (!eliminated) {
      ganhou = true;
      print("${k}");
    } else {
      k++;
    }
  }
}
