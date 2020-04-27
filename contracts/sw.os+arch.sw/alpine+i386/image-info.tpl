RUN [ ! -d /.balena/messages ] && mkdir -p /.balena/messages; echo $'Here are a few details about this Docker image (For more information please visit https://www.balena.io/docs/reference/base-images/base-images/): \nArchitecture: {{arch.sw.name}} \nOS: {{sw.os.name}} \nVariant: {{sw.stack-variant.name}} \nDefault variable(s): UDEV=off \nExtra features: \n- Easy way to install packages with `install_packages <package-name>` command' > /.balena/messages/image-info

RUN echo $'#!/bin/bash\nbalena-info\nbusybox ln -sf /bin/busybox /bin/sh\n/bin/sh "$@"' > /bin/sh-shim \
	&& chmod +x /bin/sh-shim \
	&& ln -f /bin/sh /bin/sh.real \
	&& ln -f /bin/sh-shim /bin/sh