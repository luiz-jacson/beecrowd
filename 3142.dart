
import 'dart:convert';
import 'dart:io';

void main() {
  stdin.transform(utf8.decoder).transform(LineSplitter()).listen((linha) {
    String coluna = linha;
    int soma = 0;
    if (coluna.length == 1) {
        print(coluna[0].codeUnits[0] - 64);
      } else if (coluna.length == 2) {
        soma = ((coluna[0].codeUnits[0] - 64) * 26) +
               (coluna[1].codeUnits[0] - 64);
        print(soma);
      } else {
        if (coluna.length > 3) {
          print('Essa coluna nao existe Tobias!');
        } else if ((coluna.length >= 1 && coluna[0].codeUnits[0] > 88) ||
                   (coluna.length >= 2 && coluna[0].codeUnits[0] == 88 && coluna[1].codeUnits[0] > 70) || 
                   (coluna.length == 3 && coluna[0] == 'X' && coluna[1] == 'F' && coluna.codeUnits[2] > 68)) { 
          print('Essa coluna nao existe Tobias!');
        } else {
          soma = (coluna.codeUnits[0] - 64) * 26 * 26 +
                 (coluna.codeUnits[1] - 64) * 26 +
                 (coluna.codeUnits[2] - 64);
          print(soma);
        }
      }
  });
}