LN = ln -fFs
RM = rm -rf

DOTSRCS = $(wildcard dot*)
DOTOBJS = $(subst dot, ${HOME}/, ${DOTSRCS})

BINSRCS = $(wildcard bin/*)
BINOBJS = $(subst bin, ${HOME}/bin, ${BINSRCS})

all: ${DOTOBJS} ${BINOBJS} ${HOME}/.vim

${HOME}/.vim:
	mkdir ${HOME}/.vim ${HOME}/.vim/undo ${HOME}/.vim/tmp ${HOME}/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim

${HOME}/bin:
	mkdir ${HOME}/bin

${DOTOBJS}:
	${LN} $(subst ${HOME}/, ${PWD}/dot, $@) $@

${BINOBJS}: ${HOME}/bin
	${LN} $(subst ${HOME}/bin, ${PWD}/bin, $@) $@

clean:
	${RM} ${DOTOBJS} ${BINOBJS} ${HOME}/.vim

.PHONY: all clean
