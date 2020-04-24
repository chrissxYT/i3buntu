cp:
	apt-key exportall 2>/dev/null > keys.gpg

install:
	apt-key add keys.gpg
	apt update
	sh -c 'for p in $$(cat apt) ; do apt install -y $$p ; done'
	sh -c 'for p in $$(cat pip3) ; do pip3 install $$p ; done'
	./netsh
