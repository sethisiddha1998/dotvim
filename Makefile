
# Vim scripts Makefile
VIMRC:=vimrc
VIMRC_BUNDLES:=vimrc.full.bundles.vimrc
VIM_FILES:=$(VIMRC) $(VIMRC_BUNDLES)

HOME_VIMRC=$(HOME)/.vimrc
HOME_DOTVIM=$(HOME)/.vim

## ETC_VIMRC_LOCAL=/etc/vim/vimrc.local


default: test

help:
	$(MAKE) list_vimrc_comments
	#$(MAKE) list_vimrc_shortcuts
	#$(MAKE) list_vim_mappings

edit:
	# Open editor with primary project files
	echo $(EDITOR)
	$(EDITOR) README.rst Makefile $(VIM_FILES)


list_vimrc_comments:
	# List vimrc special comments
	egrep -h '^\s*"\s' $(VIM_FILES) | sed 's/"//'

list_vimrc_shortcuts:
	# List vimrc keyboard shortcut comments (starting with '"  '')
	egrep -h '^\s*"  ' $(VIM_FILES) | sed 's/"//'

VIM_MAPPINGS:=./tmp.output
list_vim_mappings:
	vim \
	 -c ':redir! > ${VIM_MAPPINGS}' \
	 -c ':map' \
	 -c ':redir END' \
	 -c ':exit'
	cat '${VIM_MAPPINGS}'

test:
	# Test this Makefile
	$(MAKE) test_start_vim
	$(MAKE) test_start_gvim
	$(MAKE) test_start_tinyvim
	##$(MAKE) edit
	$(MAKE) list_vimrc_comments
	$(MAKE) list_vimrc_shortcuts

test_start_vim:
	# Start vim and exit
	vim -c 'exit'

test_start_tinyvim:
	# Start (tiny) vim and exit
	vim --cmd 'let g:tinyvim = 1' -c 'exit'

test_start_gvim:
	# Start vim and exit
	gvim -c 'exit'


build:


install-manual:
	# Install Vundle.vim, start vim, list bundles, install them,
	# and install tinyvim
	#
	$(MAKE) install_vundle
	$(MAKE) test_start_vim
	$(MAKE) list_bundles
	$(MAKE) install_bundles
	$(MAKE) test_start_vim
	$(MAKE) test_start_tinyvim
	#
	### These must be done manually:
	#make install_home     			# add symlink to ~/.vimrc
	#make install_powerline_fonts   # install patched powerline fonts

install:
	# Install Vundle.vim, start vim, list bundles, install them,
	# and install tinyvim
	#
	$(MAKE) install_vundle
	$(MAKE) list_bundles
	$(MAKE) install_bundles
	#$(MAKE) test_start_vim
	#$(MAKE) test_start_tinyvim
	#
	### These must be done manually:
	#make install_home     			# add symlink to ~/.vimrc
	#make install_powerline_fonts   # install patched powerline fonts

install_home:
	test -f $(HOME)/.vimrc && (\
		cp $(HOME)/.vimrc $(HOME)/.vimrc.backup && \
		rm $(HOME)/.vimrc) || true
	#test ! -d $(HOME)/.vim/
	ln -s $(PWD)/vimrc $(HOME)/.vimrc


install_vim_apt:
	sudo apt-get install vim-nox vim-gnome

install_vim_yum:
	sudo yum install vim-enhanced vim-X11

install_vim_dnf:
	sudo dnf install vim-enhanced vim-X11

install_vim_src:
	$(SHELL) setup_vim_deb.sh

install_powerline_fonts:
	$(SHELL) ./scripts/setup_powerline_fonts.sh

install_vundle:
	# Install or update vundle
	mkdir -p bundle/
	test ! -d bundle/Vundle.vim \
		&& git clone https://github.com/gmarik/Vundle.vim bundle/Vundle.vim \
		|| $(MAKE) update_vundle
	# ->	|| $(MAKE) update_vundle

update_vundle:
	# git pull Vundle from upstream
	test -d bundle/Vundle.vim
	test -d bundle/Vundle.vim/.git || ( \
		rm -rf bundle/Vundle.vim && \
		git clone https://github.com/gmarik/Vundle.vim bundle/Vundle.vim )
	cd bundle/Vundle.vim \
		&& git pull https://github.com/gmarik/Vundle.vim master

list_bundles:
	# List vimrc Bundles
	egrep "^Bundle '" $(VIMRC_BUNDLES) | sed "s/Bundle '\(.*\)'/\1/g"

pyrpo:
	# List repositories with pyrpo (pip install pyrpo)
	pyrpo -s . -r sh | tee pyrpo.log.sh

install_bundles:
	# Listall bundles with Vundle
	vim +PluginInstall +qall

update_bundles:
	# Listall bundles with Vundle
	vim +PluginUpdate +qall

ls_bundles:
	(cd ./bundle && ls) | tee bundles.current

hg_changelog:
	hg log --style=changelog

hg_push:
	hg push default

pull:
	git pull

push:
	git push

.PHONY: all
all: test build

profileoptions:
	vim --version | grep --color=auto -E '+startuptime|+profile'

startuptime:
	vim --startuptime startup.report

profile_startup:
	vim --cmd 'profile start profile.log' \
		--cmd 'profile func *' \
		--cmd 'profile file *' \
		-c 'profdel func *' \
		-c 'profdel file *' \
		-c 'qa!'


profile_startup_special:
	vim --cmd 'profile start profile.log' \
		--cmd 'profile func *' \
		--cmd 'profile file *' \
		-c 'profdel func *' \
		-c 'profdel file *' \
		./bundle/vimwiki/README.md
