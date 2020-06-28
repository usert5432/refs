VERSION = 0.1.0

.PHONY : all install dist clean

PREFIX  ?= /usr/local
DATADIR ?= $(PREFIX)/share
MANDIR  ?= $(DATADIR)/man
DISTDIR ?= refs-$(VERSION)

all: ;

clean:
	rm -f $(DISTDIR).tar.gz

dist:
	@echo Creating dist release $(DISTDIR)
	mkdir -p $(DISTDIR)
	cp Makefile LICENSE README.rst $(DISTDIR)/
	cp refs refs.1 $(DISTDIR)/
	tar -c -f $(DISTDIR).tar --remove-files $(DISTDIR)/
	gzip $(DISTDIR).tar

install: refs
	@echo "Installing $< to '${DESTDIR}$(PREFIX)/bin'"
	mkdir -p ${DESTDIR}$(PREFIX)/bin
	cp refs ${DESTDIR}$(PREFIX)/bin/
	chmod 0755 ${DESTDIR}$(PREFIX)/bin/refs
	mkdir -p ${DESTDIR}$(MANDIR)/man1
	sed "s/VERSION/$(VERSION)/g" refs.1 > ${DESTDIR}$(MANDIR)/man1/refs.1
	chmod 0644 ${DESTDIR}$(MANDIR)/man1/refs.1

