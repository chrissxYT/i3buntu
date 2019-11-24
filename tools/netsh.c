#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define VERSION "1.6"

#define HELP "netsh "VERSION"\n"\
             "(c) 2019 Christian Erwin Häußler, chrissx Media\n"\
             "\n"\
             "Usage: netsh [OPTIONS] [URL/repo] [OPTIONS] [URL/repo] ... \n"\
             "\n"\
             "  --\n"\
             "    Finish the options and treat all remaining arguments as repos/URLs.\n"\
             "  -c, --clone\n"\
             "    Set or unset the clone flag.\n"\
             "  -f, --file\n"\
             "    Set the file used when clone is disabled.\n"\
             "  -C, --command\n"\
             "    Set the command executed when clone is enabled.\n"\
             "  -s , --scm\n"\
             "    Set the SCM used for cloning. (git and hg are tested)\n"\
             "  -v, --version\n"\
             "    Print the version number.\n"\
             "  -h, --help\n"\
             "    Print this screen.\n"\

#define ARGSTART if(!strcmp(s, "--")) argsended = 1
#define ARG(s, unix, gnu) else if(!argsended && (!strcmp(s, "-"unix) || !strcmp(s, "--"gnu)))
#define url(s) (!strncmp((s), "http://", 7) || \
        !strncmp((s), "https://", 8) || !strncmp((s), "git://", 6) ||\
        !strncmp((s), "svn://", 6) || !strncmp((s), "cvs://", 6) || \
        !strncmp((s), "hg://", 5))
#define EXEC(s) int __exec_rc = system(s); if(__exec_rc) printf("Got error from system(\"%s\"): %d\n", s, __exec_rc)

char *rurl(char *u, char *bfr, int c, char *f)
{
        if(url(u)) return u;
        else if(!strncmp(u, "bb://", 5) && c) sprintf(bfr, "https://bitbucket.org/%s", u + 5);
        else sprintf(bfr, c ? "https://github.com/%s" :
                "https://github.com/%s/raw/master/%s",
                u, f);
        return bfr;
}

int main(int argc, char **argv)
{
        int c = 0, argsended = 0;
        char *cmd = "./netsh";
        char *f = "netsh";
        char *scm = "git";
        for(int i = 1; i < argc; i++)
        {
                char *s = argv[i];
                char bfr[strlen(s) + 1024];
                char buf[strlen(s) + 1024];
                char fdb[16];
                ARGSTART;
                ARG(s, "c", "clone") c = !c;
                ARG(s, "f", "file") f = argv[++i];
                ARG(s, "C", "command") cmd = argv[++i];
                ARG(s, "s", "scm") scm = argv[++i];
                ARG(s, "v", "version") puts(VERSION);
                ARG(s, "h", "help") puts(HELP);
                else if(c)
                {
                        sprintf(fdb, ".netsh%4lx", time(0));
                        sprintf(bfr, "%s clone '%s' %s && \
                                        cd %s && %s; cd ..; \
                                        rm -rf %s",
                                        scm, rurl(s, buf, 1, f),
                                        fdb, fdb, cmd, fdb);
                        EXEC(bfr);
                }
                else
                {
                        sprintf(fdb, ".netsh%4lx", time(0));
                        sprintf(bfr, "curl -Lo '%s' '%s'; \
                                      chmod +x '%s'&& ./%s; rm -f %s",
                                     fdb, rurl(s, buf, 0, f),
                                     fdb, fdb, fdb);
                        EXEC(bfr);
                }
        }
        return 0;
}
