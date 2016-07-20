#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include "prof.h"

int func2(int a) {
    int i = 0;
    for (i = 0; i < 1000; i++) {
        a+=1;
    }
    return a;
}

int func1(int c) {
    int i = 0;
    for (i = 0; i < 1000; i++) {
        c += func2(i);
        usleep(100);
    }
    return c;
}

int main(int argc, char* argv[]) {
    fprintf(stderr, "build time: %s %s \n", __DATE__, __TIME__);
    int nresult = 0;
    int i = 0;
    fprintf(stderr, "gprof start..\n");

    monstartup("/data/gprof");
    for (i = 0; i < 100; i++) {
        nresult = func1(1);
    }
    fprintf(stderr, "gprof end..(%d)\n", nresult);
    moncleanup();
    return 0;
}
