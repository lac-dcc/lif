#ifndef TAINT_H
#define TAINT_H

#include <valgrind/memcheck.h>

#define secret __attribute__((annotate("secret")))

#ifdef ENABLE_CTGRIND
#define ct_secret(addr, len) VALGRIND_MAKE_MEM_UNDEFINED(addr, len)
#define ct_public(addr, len) VALGRIND_MAKE_MEM_DEFINED(addr, len)
#else
#define ct_secret(addr, len)
#define ct_public(addr, len)
#endif

#endif
