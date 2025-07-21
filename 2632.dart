import 'dart:io';
import 'dart:math';

double calcularDistancia(x, y, cx, cy) {
  return sqrt(((x - cx) * (x - cx)) + ((y - cy) * (y - cy)));
}

void main() {
  int T = int.parse(stdin.readLineSync()!);
  for (int j = 0; j < T; j++) {
    int w, h, x0, y0, l, cx, cy;
    List<String> firstLine = stdin.readLineSync()!.split(' ');
    //entrada 1
    w = int.parse(firstLine[0]);
    h = int.parse(firstLine[1]);
    x0 = int.parse(firstLine[2]);
    y0 = int.parse(firstLine[3]);
    //entrada 2
    List<String> secondLine = stdin.readLineSync()!.split(' ');
    String element = secondLine[0];
    l = int.parse(secondLine[1]);
    cx = int.parse(secondLine[2]);
    cy = int.parse(secondLine[3]);

    //calcular menor distancia entre o retangulo e o centro da circunferencia
    double menorDistancia = 0;
    double result = 0;
    double result2 = 0;
    for (int i = y0; i <= y0 + h; i++) {
      if (i == y0) {
        menorDistancia = calcularDistancia(x0, i, cx, cy);
      }
      result = calcularDistancia(x0, i, cx, cy);
      if (result < menorDistancia) {
        menorDistancia = result;
      }
      result2 = calcularDistancia(x0 + w, i, cx, cy);
      if (result2 < menorDistancia) {
        menorDistancia = result2;
      }
    }
    for (int i = x0; i <= x0 + w; i++) {
      result = calcularDistancia(i, y0, cx, cy);
      if (result < menorDistancia) {
        menorDistancia = result;
      }
      result2 = calcularDistancia(i, y0 + h, cx, cy);
      if (result2 < menorDistancia) {
        menorDistancia = result2;
      }
    }

    bool dentroRetangulo = (cx >= x0 && cx <= x0 + w) && (cy >= y0 && cy <= y0 + h);

    int raio = 0;
    int dano = 0;

    if (element == "fire") {
      dano = 200;
      if (l == 1)
        raio = 20;
      else if (l == 2)
        raio = 30;
      else if (l == 3)
        raio = 50;
    } else if (element == "water") {
      dano = 300;
      if (l == 1)
        raio = 10;
      else if (l == 2)
        raio = 25;
      else if (l == 3)
        raio = 40;
    } else if (element == "earth") {
      dano = 400;
      if (l == 1)
        raio = 25;
      else if (l == 2)
        raio = 55;
      else if (l == 3)
        raio = 70;
    } else if (element == "air") {
      dano = 100;
      if (l == 1)
        raio = 18;
      else if (l == 2)
        raio = 38;
      else if (l == 3)
        raio = 60;
    }

    if (dentroRetangulo || menorDistancia <= raio) {
      print(dano);
    } else {
      print(0);
    }
  }
}
