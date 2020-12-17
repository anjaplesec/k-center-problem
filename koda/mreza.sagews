#IDEJA: ustvarimo matriko velikosti mxn, ki ima na nekaterih mestih 0,
#kar pomeni da tam ni povezave, drugje pa ima število, ki predstavla
#našo utež, torej radaljo med vozliščema.

#v vsaki vrstici je lahko 0 ali drugo poljubno naravno število
import numpy as np
import random

def mreza(n):
    matrika = np.random.randint(2, size=(n,n))
    for i in range(0, n):
        matrika[i][i] = 0
        for j in range(i+1, n):
            if matrika[i][j] == 1:
                a = random.randrange(n*n)
                matrika[i][j] = a
                matrika[j][i] = a
            else:
                matrika[j][i] = 0
    return matrika


def razdalja(i,j):
    return mreza[i][j]

print(mreza(2))
print(mreza(5))









