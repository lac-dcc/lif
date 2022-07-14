#ifndef DIJKSTRA_H
#define DIJKSTRA_H

#include "../../../../include/taint.h"

#define INPUT_SIZE 16 // num edges -> 16 * 16 = 256

__attribute__((noinline))
int dijkstra(int n, int s, int t, int e[][INPUT_SIZE]);

extern secret int x;

#endif // DIJKSTRA_H
