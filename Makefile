COLOR=  \
	"" \
	-dark \
	-light

SIZE=  \
	"" \
	-compact

VERSION= 3.18 \
	3.20 \
	3.22 \
	3.24

%.scss: %.css
	sassc -M -t expanded "$@" "$<"

color-compact-%: 

color-%: color-compact-% src/gtk-3.0/3.18/gtk%.scss


all: color-dark color-light
	#Generating the css...
	
	@for color in $(COLOR) ; do \
		sassc -M -t expanded ./src/gtk-3.0/3.18/gtk$${color}.scss ./src/gtk-3.0/3.18/gtk$${color}.css ; \
		for size in $(SIZE) ; do \
			for version in $(VERSION) ; do \
				sassc -M -t expanded ./src/gtk-3.0/$${version}/gtk$${color}$${size}.scss ./src/gtk-3.0/$${version}/gtk$${color}$${size}.css ; \
			done ; \
			for version in $(VERSION) ; do \
				sassc -M -t expanded ./src/gnome-shell/$${version}/gnome-shell$${color}$${size}.scss ./src/gnome-shell/$${version}/gnome-shell$${color}$${size}.css ; \
			done \
		done \
	done

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
