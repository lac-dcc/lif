#include "../include/log_redactor.h"
#include "../../include/taint.h"

#include <stdlib.h>
#include <unistd.h>

int main () {
    const unsigned L0 = 3;
    const unsigned L1 = 10;
    const unsigned P = 4;

    char *log[L0];
    secret char pattern[P];

    for (unsigned i = 0; i < L0; i++) {
        log[i] = (char *) malloc(L1);
        // For constantine, we will need another way to read the log;
        // otherwise, "read" routine will taint it.
        read(0, log[i], L1);

        // Mark input as public for ct_grind check:
        ct_public(log[i], L1);
    }

    read(0, pattern, P);

    // Mark input as secret for ct_grind check:
    ct_secret(pattern, P);

    log_redactor(log, pattern, L0, L1, P);
    for (unsigned j = 0; j < L0; j++) {
        // Write like Constantine:
        write(1, log[j], L1);
    }
}
