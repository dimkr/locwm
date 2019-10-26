# $OpenBSD: Makefile,v 1.25 2017/07/14 17:23:38 okan Exp $

PROG=		cwm

SRCS=		calmwm.c screen.c xmalloc.c client.c menu.c \
		search.c util.c xutil.c conf.c xevents.c group.c \
		kbfunc.c parse.c \
		compat/strlcpy.c compat/strlcat.c compat/strtonum.c
OBJS=		$(SRCS:.c=.o)

CFLAGS += -Wall -D_GNU_SOURCE -D__dead= -Icompat \
          $(shell pkg-config --cflags xft freetype2 xinerama xrandr x11)
LDFLAGS += $(shell pkg-config --libs xft freetype2 xinerama xrandr x11)

all: $(PROG)

install: $(PROG)
	install -D -m 755 cwm $(DESTDIR)$(PREFIX)/bin/cwm
	install -D -m 644 cwm.1 $(DESTDIR)$(PREFIX)/share/man/man1/cwm.1
	install -D -m 644 cwmrc.5 $(DESTDIR)$(PREFIX)/share/man/man5/cwmrc.5

$(PROG): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

parse.c: parse.y
	$(YACC) -o $@ $^

clean:
	rm -f $(PROG) $(OBJS) parse.c
