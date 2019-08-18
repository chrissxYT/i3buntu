.PHONY: cp all clean install

all:
	gcc netsh.c -O3 -s -o netsh

clean:
	rm -f netsh

cp:
	cp -f /usr/bin/screenshot screenshot
	cp -f /usr/bin/bookmark bookmark
	cp -f /usr/bin/_update _update
	cp -f /usr/bin/update update
	cp -f /usr/bin/udpkg udpkg
	cp -f /usr/bin/todo todo
	cp -f /usr/bin/eos eos
	cp -f /bin/mnt mnt
	cp -f /bin/umnt umnt

install: all
	cp -f update /usr/bin/update
	cp -f _update /usr/bin/_update
	cp -f mnt /bin/mnt
	cp -f umnt /bin/umnt
	cp -f netsh /usr/bin/netsh
	cp -f udpkg /usr/bin/udpkg
	cp -f screenshot /usr/bin/screenshot
	cp -f todo /usr/bin/todo
	cp -f bookmark /usr/bin/bookmark
