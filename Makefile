PREFIX=${DESTDIR}/opt/nm-plugin-splitdns
SPEC_FILE=./RPM/nm-plugin-splitdns.spec
RPM_VERSION	:= $(shell [ -f ${SPEC_FILE} ] && sed -ne "s/^Version:\s\+\(.*\)/\1/p" < ${SPEC_FILE} )
RPM_RELEASE	:= $(shell [ -f ${SPEC_FILE} ] && sed -ne "s/^Release:\s\+\(.*\)/\1/p" < ${SPEC_FILE} )
RPM_NAME 	:= $(shell [ -f ${SPEC_FILE} ] && sed -ne "s/^Name:\s\+\(.*\)/\1/p" < ${SPEC_FILE} )
SRC_DIR		:= $(shell basename `pwd`)
TAR_FILE:=$(HOME)/rpmbuild/SOURCES/${RPM_NAME}-${RPM_VERSION}.tar.gz
TAR_EXCLUDE=--exclude=.*.sw? --exclude=*~ --exclude=RPM --exclude=.git --exclude=.osc


BIN_DIR=${PREFIX}/bin
CONF_DIR=${PREFIX}/etc
SUB_DIRS=${DESTDIR}/etc/NetworkManager/dispatcher.d ${PREFIX} ${CONF_DIR} ${BIN_DIR} ${PREFIX}/tmp ${PREFIX}/templates

all:

install: check_dir install_bin install_config

check_dir:
	$(foreach var, $(SUB_DIRS), [ -d ${var} ] || mkdir -p ${var};)

install_bin:
	install -m 755 ./bin/vpn_splitdns	${BIN_DIR}/vpn_splitdns
	rm -rf ${DESTDIR}/etc/NetworkManager/dispatcher.d/zzz_vpn_splitdns
	ln -s /opt/nm-plugin-splitdns/bin/vpn_splitdns ${DESTDIR}/etc/NetworkManager/dispatcher.d/zzz_vpn_splitdns

install_config:
	[ -e ${CONF_DIR}/vpn_splitdns.cnf ] || install -m 644 ./etc/vpn_splitdns.cnf ${CONF_DIR}/vpn_splitdns.cnf

tar:
	tar -C .. -cvzf ${TAR_FILE} ${TAR_EXCLUDE} ${SRC_DIR}
