cp:
	cp -f ~/.vimrc vimrc
	cp -f ~/.zshrc zshrc
	cp -f ~/.xinitrc xinitrc
	cp -f ~/.Xmodmap Xmodmap
	cp -f ~/.XCompose XCompose
	cp -f /etc/environment env
	cp -f ~/.config/gtk-3.0/settings.ini gtk
	cp -f /etc/issue issue
	cp -f /etc/issue.net issue.net
	cp -f /etc/lsb-release lsbr
	cp -f /etc/os-release os-release
	cp -f /etc/default/grub grub
	cp -f ~/.config/kitty/kitty.conf kitty
	cp -f ~/.config/youtube-dl/config ytdl
	cp -f ~/.config/compton.conf compton.conf
	cp -f ~/.zshtheme zsh-theme
	@cd i3 && make cp

install:
	cp -f vimrc ~/.vimrc
	cp -f zshrc ~/.zshrc
	cp -f xinitrc ~/.xinitrc
	cp -f Xmodmap ~/.Xmodmap
	cp -f XCompose ~/.XCompose
	mkdir -p ~/.config/gtk-3.0
	mkdir -p ~/.config/kitty
	mkdir -p ~/.config/youtube-dl
	cp -f gtk ~/.config/gtk-3.0/settings.ini
	cp -f kitty ~/.config/kitty/kitty.conf
	cp -f ytdl ~/.config/youtube-dl/config
	cp -f compton.conf ~/.config/compton.conf
	cp -f zsh-theme ~/.zshtheme
	@cd i3 && make install

update: install
