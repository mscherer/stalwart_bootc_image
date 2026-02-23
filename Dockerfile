FROM quay.io/bootc-devel/fedora-bootc-43-minimal@sha256:b402a16aa3e2a6fad29f1f3743ccbcae3163e3345e07ad79d44b4aa5f8a4613e
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
dnf install -y --setopt=install_weak_deps=false openssh-server systemd-networkd-defaults

dnf clean all
rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/
EORUN

# disable the flood of message on the console
COPY disable-flood.conf /usr/lib/sysctl.d/60-disable-flood.conf
# add stalwart
COPY stalwart.container /usr/share/containers/systemd/stalwart.container
# needed as bootc container lint complain about it. Some work should be done
# to get if fixed upstream
COPY caddy.tmpfile.conf /usr/lib/tmpfiles.d/caddy.conf
COPY motd.conf /usr/lib/motd.d/

COPY set_hostname/set_hostname.service /usr/lib/systemd/system/set_hostname.service
COPY set_hostname/set_hostname.sh      /usr/local/bin/set_hostname.sh

RUN bootc container lint --fatal-warnings
