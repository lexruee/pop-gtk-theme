%.css: %.scss
	sassc -M -t expanded "$<" "$@"

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


