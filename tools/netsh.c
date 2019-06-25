#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define is_url(s) (!strncmp((s), "http://", 7) || \
        !strncmp((s), "https://", 8) || !strncmp((s), "git://", 6))

char *rurl(char *u, char *bfr, int clone)
{
        if(!is_url(u))
        {
                sprintf(bfr, clone ? "https://github.com/%s" :
                        "https://github.com/%s/raw/master/netsh",
                        u);
                return bfr;
        }
        else return u;
}

int main(int argc, char **argv)
{
        int clone = 0;
        for(int i = 1; i < argc; i++)
        {
                char *s = argv[i];
                char bfr[strlen(s) + 1024];
                char buf[strlen(s) + 1024];
                if(!strcmp(s, "-c") || !strcmp(s, "--clone"))
                        clone = !clone;
                else if(clone)
                {
                        char dir[16];
                        sprintf(dir, ".netsh%4lx", time(0));
                        sprintf(bfr, "git clone '%s' %s; \
                                        cd %s; ./netsh; cd ..; \
                                        rm -rf %s",
                                        rurl(s, buf, 1),
                                        dir, dir, dir);
                        system(bfr);
                }
                else
                {
                        sprintf(bfr, "curl -L '%s' | sh",
                                        rurl(s, buf, 0));
                        system(bfr);
                }
        }
        return 0;
}
