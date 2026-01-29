FROM quay.io/bootc-devel/fedora-bootc-43-minimal@sha256:3a624d0e5efe3e4088b6d44f4837720caec5e52f236f4496d2b26f8b4c64ab02
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

dnf install -y --setopt=install_weak_deps=false htop iftop strace tcpdump lshw iproute jq
# systemd-networkd-defaults pull systemd-networkd
dnf install -y --setopt=install_weak_deps=false openssh-server systemd-networkd-defaults

dnf install -y --setopt=install_weak_deps=false vim-minimal
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
RUN bootc container lint --fatal-warnings
