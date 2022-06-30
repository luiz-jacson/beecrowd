from time import time
def dif():
    minor = sum(seq)
    actp = int(len(seq) / 2)
    cont = 0
    soma = sum(seq[:actp])
    soma2 = sum(seq[actp:])
    while True:
        if abs(soma2 - soma) < minor:
            minor = abs(soma2 - soma)
        else:
            return int(minor)
            break
        if soma2 > soma:
            cont += 1
            soma += seq[actp - 1 + cont]
            soma2 -= seq[actp - 1 + cont]
        else:
            cont -= 1
            soma -= seq[actp + cont]
            soma2 += seq[actp + cont]



while True:
    try:
        n = int(input())
        seq = [int(x) for x in (input().split())]
        print(dif())
    except EOFError:
        break
