#include <stdio.h>

#define N 32

int comp(int *a, int *b) {
    for (int i = 0; i < N; i++)
        if (a[i] != b[i]) return 0;
    return 1;
}

int main() {
    int a[N], b[N];
    for (int i = 0; i < N; i++) a[i] = b[i] = i;
    int r = comp(a, b);
    printf("%d\n", r);
    return 0;
}
