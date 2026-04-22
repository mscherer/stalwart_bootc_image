FROM quay.io/bootc-devel/fedora-bootc-43-minimal@sha256:a61dd19b6bfaa30503a2783b23bf9c49a5b129c6543a375bbbab253645935445
#
# empty space for easier rebasing
#

# needed to start the various software at boot
COPY mail_server.preset /usr/lib/systemd/system-preset/01-mail_server.preset

# install caddy (reverse proxy) and various stuff
RUN <<EORUN
# fix/workaround https://bugzilla.redhat.com/show_bug.cgi?id=2432642
dnf install -y --setopt=install_weak_deps=false bubblewrap

dnf install -y --setopt=install_weak_deps=false caddy

# removed, can be installed with bootc usr-overlay
#dnf install -y --setopt=install_weak_deps=false vim-minimal
#dnf install -y --setopt=install_weak_deps=false htop iftop strace tcpdump lshw iproute jq
# systemd-networkd-defaults pull systemd-networkd
dnf install -y --setopt=install_weak_deps=false openssh-server systemd-networkd-defaults jq

dnf clean all

rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/ /run/dnf 

EORUN

# disable the flood of message on the console
COPY disable-flood.conf /usr/lib/sysctl.d/60-disable-flood.conf

# add stalwart
COPY stalwart/stalwart.container /usr/share/containers/systemd/stalwart.container
COPY stalwart/config.json /usr/local/etc/config.json
COPY stalwart/stalwart-cli /usr/local/bin/stalwart-cli

# needed as bootc container lint complain about it. Some work should be done
# to get if fixed upstream
COPY container_lint.tmpfiles.conf /usr/lib/tmpfiles.d/container_lint.conf
COPY motd.conf /usr/lib/motd.d/

COPY set_hostname/set_hostname.service /usr/lib/systemd/system/set_hostname.service
COPY set_hostname/set_hostname.sh      /usr/local/bin/set_hostname.sh

COPY set_ipv6/set_ipv6.service /usr/lib/systemd/system/set_ipv6.service
COPY set_ipv6/set_ipv6.sh      /usr/local/bin/set_ipv6.sh

RUN <<EORUN2
systemctl preset-all
EORUN2

RUN bootc container lint --fatal-warnings
