#include "bar.h"
#include "foo.h"
#include <stdio.h>

int main(int argc, char *argv[])
{
    printf("Woof Woof!\n");
    
    Bar bar;
    Foo foo(bar);
    foo.baz(true);
    foo.baz(false);
}
