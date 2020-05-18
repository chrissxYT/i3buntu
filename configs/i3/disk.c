#include <stdint.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/statvfs.h>

char PREFIXES[][3] = { "", "Ki", "Mi", "Gi", "Ti", "Pi", "Ei", "Zi", "Yi" };

int main()
{
        struct statvfs fs;
        uint64_t i;
        int j;
        if(statvfs("/", &fs)) return 1;
        i = fs.f_frsize * fs.f_bavail;
        for(j = 0; i >= 5120; i /= 1024, j++);
        printf("%li%sB\n", i, PREFIXES[j]);
        return 0;
}
