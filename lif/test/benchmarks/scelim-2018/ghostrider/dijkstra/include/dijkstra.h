#ifndef DIJKSTRA_H
#define DIJKSTRA_H

#include "../../../../include/taint.h"

#define INPUT_SIZE 32 // num edges -> 32*32 = 1024

__attribute__((noinline))
int dijkstra(int n, int s, int t, int e[][INPUT_SIZE]);

extern secret int x;

#endif // DIJKSTRA_H
