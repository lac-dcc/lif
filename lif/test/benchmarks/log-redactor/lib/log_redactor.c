#include "../include/log_redactor.h"
#include "../../include/taint.h"

#ifdef ENABLE_UNROLL
void log_redactor(char *log[], char *pattern) {
#else
void log_redactor(
    char *log[], char *pattern, const unsigned L0,
    const int L1, const int P
) {
#endif
    for (unsigned i = 0; i < L0; i++) {
        unsigned found = 0;

        for (unsigned j = 0; j < L1 - P + 1; j++) {
            unsigned k = 0;
            while (k < P) {
                if (pattern[k] != log[i][j + k]) break;
                k++;
            }
            if (k == P) found = 1;
        }

        if (!found) continue;
        for (unsigned j = 0; j < L1; j++) {
            if (log[i][j] >= '0' && log[i][j] <= '9')
                log[i][j] = '*';
        }
    }
}
