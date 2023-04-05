#!/usr/bin/make -f

DIRS := dev \
		etc \
		home \
		lib/modules \
		media \
		proc \
		root \
		run/media \
		run/netns \
		snap \
		sys \
		tmp \
		usr/bin \
		usr/lib/snapd \
		usr/local/share/fonts \
		usr/share/fonts \
		var/cache/fontconfig \
		usr/src \
		var/lib/snapd \
		var/log \
		var/snap \
		var/tmp \
		bin

install:
	$(foreach dir,$(DIRS),mkdir -p $(DESTDIR)/$(dir);)
	sudo apt-get update
	sudo apt-get install busybox-static

clean:
	rm -rf $(DESTDIR)

release-snap:
	snapcraft upload --release=stable ./*.snap 