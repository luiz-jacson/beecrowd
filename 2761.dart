import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

void main() {
  int integer = 0;
  bool chkint = false;
  String real = '';
  bool chkreal = false;
  String char = 'a';
  bool chkchar = false;
  String phrase = '';
  double realcomp = 0;
  String tmp = '';
  String variables = stdin.readLineSync()!;
  for (int i = 0; i < variables.length; i++) {
    if (variables[i] == ' ' && !chkint) {
      chkint = true;
      integer = int.parse(tmp);
      tmp = '';
    } else if (variables[i] == ' ' && !chkreal) {
      chkreal = true;
      real = tmp;
      tmp = '';
    } else if (variables[i] == ' ' && !chkchar) {
      chkchar = true;
      char = tmp;
      tmp = '';
    } else {
      tmp += variables[i];
    }
  }

var float32buffer = Float32List(1);
float32buffer[0] = double.parse(real).toDouble();

double f = float32buffer[0];

print("$integer${f.toStringAsFixed(6)}$char$tmp");
print("$integer\t${f.toStringAsFixed(6)}\t$char\t$tmp");
print("${integer.toString().padLeft(10)}${f.toStringAsFixed(6).padLeft(10)}${char.padLeft(10)}${tmp.padLeft(10)}");
}
