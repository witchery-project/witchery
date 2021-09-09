install:
	install -Dm755 ${DESTDIR}/usr/bin
	install -m755 witchery-buildapk ${DESTDIR}/usr/bin
	install -m755 witchery-compose ${DESTDIR}/usr/bin