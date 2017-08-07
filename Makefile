CSS=\
	src/gtk-3.0/3.18/gtk.css \
	src/gtk-3.0/3.18/gtk-dark.css \
	src/gtk-3.0/3.18/gtk-light.css \
	src/gnome-shell/3.18/gnome-shell.css \
	src/gnome-shell/3.18/gnome-shell-dark.css \
	src/gnome-shell/3.18/gnome-shell-light.css \
	src/gtk-3.0/3.20/gtk.css \
	src/gtk-3.0/3.20/gtk-dark.css \
	src/gtk-3.0/3.20/gtk-light.css \
	src/gtk-3.0/3.20/gtk-compact.css \
	src/gtk-3.0/3.20/gtk-dark-compact.css \
	src/gtk-3.0/3.20/gtk-light-compact.css \
	src/gnome-shell/3.20/gnome-shell.css \
	src/gnome-shell/3.20/gnome-shell-dark.css \
	src/gnome-shell/3.20/gnome-shell-light.css \
	src/gnome-shell/3.20/gnome-shell-compact.css \
	src/gnome-shell/3.20/gnome-shell-dark-compact.css \
	src/gnome-shell/3.20/gnome-shell-light-compact.css \
	src/gtk-3.0/3.22/gtk.css \
	src/gtk-3.0/3.22/gtk-dark.css \
	src/gtk-3.0/3.22/gtk-light.css \
	src/gtk-3.0/3.22/gtk-compact.css \
	src/gtk-3.0/3.22/gtk-dark-compact.css \
	src/gtk-3.0/3.22/gtk-light-compact.css \
	src/gnome-shell/3.22/gnome-shell.css \
	src/gnome-shell/3.22/gnome-shell-dark.css \
	src/gnome-shell/3.22/gnome-shell-light.css \
	src/gnome-shell/3.22/gnome-shell-compact.css \
	src/gnome-shell/3.22/gnome-shell-dark-compact.css \
	src/gnome-shell/3.22/gnome-shell-light-compact.css \
	src/gnome-shell/3.24/gnome-shell.css \
	src/gnome-shell/3.24/gnome-shell-dark.css \
	src/gnome-shell/3.24/gnome-shell-light.css \
	src/gnome-shell/3.24/gnome-shell-compact.css \
	src/gnome-shell/3.24/gnome-shell-dark-compact.css \
	src/gnome-shell/3.24/gnome-shell-light-compact.css

all: $(CSS)

%.css: %.scss
	sassc -M -t expanded "$<" "$@"

clean:
	rm -f $(CSS)

install:
	./install.sh $(DESTDIR)

post-install:
	-gtk-update-icon-cache -q $(DESTDIR)/usr/share/icons/Pop

gtk2:
	cd ./src/gtk-2.0 && ./recolor-assets.sh

assets:
	cd ./src/gtk-3.0/gtk-common/ && find . -type f -name *.png -exec rm -v '{}' +
	cd ./src/gtk-2.0/ && find . -type f -name *.png -exec rm -v '{}' +
	cd ./src/gtk-3.0/gtk-common/ && ./recolor-assets.sh
	cd ./src/gtk-2.0/ && ./recolor-assets.sh
	cd ./src/gtk-3.0/gtk-common/ && ./render-assets.sh
	cd ./src/gtk-2.0/ && ./render-assets.sh
	cd ./src/gtk-2.0/ && ./render-assets-dark.sh

uninstall:
	-rm -rf $(DESTDIR)/usr/share/themes/Pop
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-dark
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-light
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-compact
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-light-compact
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-dark-compact

.PHONY: all install uninstall
