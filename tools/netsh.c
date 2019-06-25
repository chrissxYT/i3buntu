#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

struct url
{
        char *c;
        int r; //is relative
};

struct config
{
        int clone;
        struct url *urls;
        int urlc;
};

int is_url(char *s)
{
        return !strncmp(s, "http://", 7) || !strncmp(s, "https://", 8)
                || !strncmp(s, "git://", 6);
}

struct url url(char *c)
{
        struct url u;
        u.r = !is_url(c);
        u.c = c;
        return u;
}

struct config parse_args(int argc, char **argv)
{
        struct config c;
        c.clone = c.urlc = 0;
        c.urls = malloc(sizeof(struct url) * argc);
        struct url *up = c.urls;
        for(int i = 1; i < argc; i++)
        {
                char *s = argv[i];
                if(!strcmp(s, "-c") || !strcmp(s, "--clone"))
                        c.clone = 1;
                else *up++ = url(s), c.urlc++;
        }
        return c;
}

char *rurl(struct url u, int clone)
{
        if(u.r)
        {
                char *bfr = malloc(strlen(u.c) + 64);
                sprintf(bfr, clone ? "https://github.com/%s" :
                        "https://github.com/%s/raw/master/netsh",
                        u.c);
                return bfr;
        }
        else return u.c;
}

int main(int argc, char **argv)
{
        struct config c = parse_args(argc, argv);
        for(int i = 0; i < c.urlc; i++)
        {
                struct url u = c.urls[i];
                printf("debug: %s %d\n", u.c, u.r);
                char bfr[strlen(u.c) + 1024];
                if(c.clone)
                {
                        char dir[16];
                        sprintf(dir, ".netsh%4lx", time(0));
                        sprintf(bfr, "git clone '%s' %s; \
                                        cd %s; ./netsh; cd ..; \
                                        rm -rf %s",
                                        rurl(u, 1), dir, dir, dir);
                        system(bfr);
                }
                else
                {
                        sprintf(bfr, "curl -L '%s' | sh", rurl(u, 0));
                        system(bfr);
                }
        }
        return 0;
}
