#include "../include/comp.h"

#ifdef ENABLE_UNROLL
int comp(int **a, int *b) {
    for (int i = 0; i < N; i++) {
        int j = 0;
        while (j < M) {
#else
int comp(int **a, int *b, int n, int m) {
    for (int i = 0; i < n; i++) {
        int j = 0;
        while (j < m) {
#endif
            if (a[i][j] != b[j]) break;
            else j++;
        }
        if (j == m) return 1;
    }
    return 0;
}
