LEAP_DIRS = $(wildcard leap*)

install:
	for dir in $(LEAP_DIRS); do \
		VERSION=$$(echo $${dir} | sed 's/leap//'); \
		mkdir -p ${DESTDIR}/usr/share/gnome-background-properties/; \
		install -D -m 0644 wallpapers-leap$${VERSION}.xml ${DESTDIR}/usr/share/gnome-background-properties/wallpapers-leap$${VERSION}.xml; \
		mkdir -p ${DESTDIR}/usr/share/wallpapers/leap$${VERSION}/; \
		if ls $${dir}/*.svg >/dev/null 2>&1; then \
			for svg in $${dir}/*.svg; do \
				png_file=${DESTDIR}/usr/share/wallpapers/leap$${VERSION}/`basename $${svg} .svg`.png; \
				rsvg-convert $${svg} -o $${png_file}; \
				optipng -o5 $${png_file}; \
				install -D -m 0644 $${png_file} ${DESTDIR}/usr/share/wallpapers/leap$${VERSION}/; \
			done; \
		fi; \
		install -D -m 0644 $${dir}/*.jpg ${DESTDIR}/usr/share/wallpapers/leap$${VERSION}/; \
		install -D -m 0644 $${dir}/*.xml ${DESTDIR}/usr/share/wallpapers/leap$${VERSION}/; \
	done
