#ifndef LOG_REDACTOR_H
#define LOG_REDACTOR_H

#ifdef ENABLE_UNROLL
#ifndef L0
#define L0 3
#endif

#ifndef L1
#define L1 10
#endif

#ifndef P
#define P 4
#endif

void log_redactor(char *log[], char *pattern);

#else
/**
 * This function will do the following:
 * - For each array A in log[] that contains pattern, it will replace every
 *   number in A by a star symbol (*).
 * L0: The number of arrays in log
 * L1: The size of each array withing log
 * P: The size of the pattern.
 */
void log_redactor(
    char *log[], char *pattern, const unsigned L0,
    const int L1, const int P
);
#endif

#endif // LOG_REDACTOR_H
