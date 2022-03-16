#include "../include/comp.h"

int comp(int **a, int *b, int n, int m) {
    for (int i = 0; i < n; i++) {
        int j = 0;
        while (j < m) {
            if (a[i][j] != b[j]) break;
            else j++;
        }
        if (j == m) return 1;
    }
    return 0;
}
