cp:
	cp -f ~/.vimrc vimrc
	cp -f ~/.zshrc zshrc
	cp -f ~/.xinitrc xinitrc
	cp -f ~/.Xmodmap Xmodmap
	cp -f /etc/environment env
	cp -f ~/.config/gtk-3.0/settings.ini gtk
	cp -f /etc/issue issue
	cp -f /etc/issue.net issue.net
	cp -f /etc/lsb-release lsbr
	cp -f /etc/os-release os-release
	cp -f ~/.config/kitty/kitty.conf kitty
	@cd i3 && make -s cp

install:
	cp -f vimrc ~/.vimrc
	cp -f zshrc ~/.zshrc
	cp -f xinitrc ~/.xinitrc
	cp -f Xmodmap ~/.Xmodmap
	cp -f gtk ~/.config/gtk-3.0/settings.ini
	cp -f kitty ~/.config/kitty/kitty.conf
	@cd i3 && make -s install

update:
	cp -f vimrc ~/.vimrc
	cp -f zshrc ~/.zshrc
	cp -f xinitrc ~/.xinitrc
	cp -f Xmodmap ~/.Xmodmap
	cp -f gtk ~/.config/gtk-3.0/settings.ini
	cp -f kitty ~/.config/kitty/kitty.conf
	@cd i3 && make -s update
