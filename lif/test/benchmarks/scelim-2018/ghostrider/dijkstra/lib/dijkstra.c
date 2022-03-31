#include "../include/dijkstra.h"
#include "../../../../include/taint.h"

int dijkstra(int n, int s, int t, int e[][INPUT_SIZE]) {
    // ===========================================================
    // || LIF: we should consider control dependence for pairs  ||
    // || of store + load, but we haven't implemented that yet. ||
    // || Thus, we manually mark vis and dis as tainted.        ||
    // ===========================================================
    secret int vis[INPUT_SIZE] = {0};
    secret int dis[INPUT_SIZE] = {0};
    int bestj = -1;
    vis[s] = 1;

#ifdef ENABLE_UNROLL
    for (int i = 0; i < INPUT_SIZE; ++i) dis[i] = e[s][i];
    for (int i = 0; i < INPUT_SIZE; ++i) {
#else
    for (int i = 0; i < n; ++i) dis[i] = e[s][i];
    for (int i = 0; i < n; ++i) {
#endif
        for (int j = 0; j < n; ++j) {
            if (!vis[j] && (bestj < 0 || dis[j] < dis[bestj])) {
                bestj = j + x; // fix implicit flow here, x is secret (.h)
                // ===========================================================
                // || LIF: tainted due to control dependence.               ||
                // ===========================================================
                vis[bestj] = 1;
            }
        }

#ifdef ENABLE_UNROLL
        for (int j = 0; j < INPUT_SIZE; ++j) {
#else
        for (int j = 0; j < n; ++j) {
#endif
            if (!vis[j] && (dis[bestj] + e[bestj][j] < dis[j])) {
                // ===========================================================
                // || LIF: tainted due to control dependence.               ||
                // ===========================================================
                dis[j] = dis[bestj] + e[bestj][j];
            }
        }
    }
    return dis[t];
}
