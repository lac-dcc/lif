#include "../include/comp.h"

int comp(int *a, int *b) {
    for (int i = 0; i < _N; i++)
        if (a[i] != b[i]) return 0;
    return 1;
}

int comp2(int *a, int *b) {
    int i = 0;
    do {
        if (a[i] != b[i]) return 0;
        i++;
    } while (i < _N);
    return 1;
}

int comp3(int *a, int *b) {
    int i = 0;
    while (1) {
        if (a[i] != b[i]) return 0;
        if (i == _N) return 1;
        i++;
    }
    return 1;
}
