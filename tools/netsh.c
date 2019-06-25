#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define VERSION "1.0"

#define arg(s, unix, gnu) (!strcmp(s, unix) || !strcmp(s, gnu))
#define no_url(s) (strncmp((s), "http://", 7) && \
        strncmp((s), "https://", 8) && strncmp((s), "git://", 6))

char *rurl(char *u, char *bfr, int c)
{
        sprintf(bfr, c ? "https://github.com/%s" :
                "https://github.com/%s/raw/master/netsh",
                u);
        return bfr;
}

int main(int argc, char **argv)
{
        int c = 0;
        for(int i = 1; i < argc; i++)
        {
                char *s = argv[i];
                char bfr[strlen(s) + 1024];
                char buf[strlen(s) + 1024];
                if(arg(s, "-c", "--clone")) c = !c;
                else if(arg(s, "-v", "--version")) puts(VERSION);
                else if(c)
                {
                        char dir[16];
                        sprintf(dir, ".netsh%4lx", time(0));
                        sprintf(bfr, "git clone '%s' %s; \
                                        cd %s; ./netsh; cd ..; \
                                        rm -rf %s",
                                        no_url(s)?rurl(s, buf, 1):s,
                                        dir, dir, dir);
                        system(bfr);
                }
                else
                {
                        sprintf(bfr, "curl -L '%s' | sh",
                                        no_url(s)?rurl(s, buf, 0):s);
                        system(bfr);
                }
        }
        return 0;
}
