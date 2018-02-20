LN = ln -fFs
RM = rm -rf

DOTSRCS = $(wildcard dot*)
DOTOBJS = $(subst dot, ${HOME}/, ${DOTSRCS})

BINSRCS = $(wildcard bin/*)
BINOBJS = $(subst bin, ${HOME}/bin, ${BINSRCS})

all: ${DOTOBJS} ${BINOBJS} ${HOME}/bin ${HOME}/.fzf ${HOME}/.vim ${HOME}/.vim/pack/minpac/opt/minpac ${HOME}/.config/nvim/init.vim ${HOME}/.tmux ${HOME}/.bash-powerline.sh ${HOME}/.bash-preexec.sh ${HOME}/.terminfo

${HOME}/.vim:
	mkdir $@ $@/undo $@/tmp

${HOME}/.vim/pack/minpac/opt/minpac: ${HOME}/.vim
	git clone https://github.com/k-takata/minpac.git $@

${HOME}/.config/nvim/init.vim:
	mkdir -p ${HOME}/.config/nvim
	ln -s ${PWD}/init.vim $@

${HOME}/.tmux:
	mkdir -p ${HOME}/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

${HOME}/bin:
	mkdir ${HOME}/bin

${HOME}/.fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
	${HOME}/.fzf/install --key-bindings --completion --no-update-rc

${HOME}/.bash-powerline.sh:
	curl https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh >$@

${HOME}/.bash-preexec.sh:
	curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o $@

${HOME}/.terminfo:
	tic -x terminfo

${DOTOBJS}:
	${LN} $(subst ${HOME}/, ${PWD}/dot, $@) $@

${BINOBJS}: ${HOME}/bin
	${LN} $(subst ${HOME}/bin, ${PWD}/bin, $@) $@

clean:
	${RM} ${DOTOBJS} ${BINOBJS} ${HOME}/bin ${HOME}/.fzf ${HOME}/.vim ${HOME}/.tmux ${HOME}/.fzf ${HOME}/.bash-powerline.sh ${HOME}/.bash-preexec.sh ${HOME}/.terminfo

.PHONY: all clean
