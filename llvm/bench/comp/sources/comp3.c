#include <stdio.h>

#define N 32

int comp(int *a, int *b) {
    for (int i = 0; i < N; i++)
        if (a[i] != b[i]) return 0;
    return 1;
}

int main() {
    int a[4], b[4];
    for (int i = 0; i < 4; i++) a[i] = b[i] = i;
    b[3] = -1;
    int r = comp(a, b);
    printf("%d\n", r);
    return 0;
}
