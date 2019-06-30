#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define VERSION "1.3"

#define arg(s, unix, gnu) else if(!strcmp(s, unix) || !strcmp(s, gnu))
#define url(s) (!strncmp((s), "http://", 7) || \
        !strncmp((s), "https://", 8) || !strncmp((s), "git://", 6))

char *rurl(char *u, char *bfr, int c, char *f)
{
        if(url(u)) return u;
        sprintf(bfr, c ? "https://github.com/%s" :
                "https://github.com/%s/raw/master/%s",
                u, f);
        return bfr;
}

int main(int argc, char **argv)
{
        int c = 0;
        char *cmd = "./netsh";
        char *f = "netsh";
        char *scm = "git";
        for(int i = 1; i < argc; i++)
        {
                char *s = argv[i];
                char bfr[strlen(s) + 1024];
                char buf[strlen(s) + 1024];
                if(0); //this is just, so our else if macros work
                arg(s, "-c", "--clone") c = !c;
                arg(s, "-f", "--file") f = argv[++i];
                arg(s, "-C", "--command") cmd = argv[++i];
                arg(s, "-s", "--scm") scm = argv[++i];
                arg(s, "-v", "--version") puts(VERSION);
                else if(c)
                {
                        char dir[16];
                        sprintf(dir, ".netsh%4lx", time(0));
                        sprintf(bfr, "%s clone '%s' %s; \
                                        cd %s; %s; cd ..; \
                                        rm -rf %s",
                                        scm, rurl(s, buf, 1, f),
                                        dir, dir, cmd, dir);
                        system(bfr);
                }
                else
                {
                        sprintf(bfr, "curl -L '%s' | sh",
                                                rurl(s, buf, 0, f));
                        system(bfr);
                }
        }
        return 0;
}
