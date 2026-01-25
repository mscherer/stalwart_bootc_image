FROM quay.io/bootc-devel/fedora-bootc-43-minimal@sha256:448f745d3240001e7275d102b590ebb1d093e8928447e8664aef2cc9aa34ec5c
#
# empty space for easier rebasing
#

COPY mail_server.preset /usr/lib/systemd/system-preset/01-mail_server.preset
# install caddy (reverse proxy)
RUN <<EORUN
# fix/workaround https://bugzilla.redhat.com/show_bug.cgi?id=2432642
dnf install -y --setopt=install_weak_deps=false bwrap

dnf install -y --setopt=install_weak_deps=false caddy 

dnf install -y --setopt=install_weak_deps=false htop iftop strace tcpdump lshw iproute

dnf install -y --setopt=install_weak_deps=false openssh-server systemd-networkd-defaults systemd-networkd

dnf install -y --setopt=install_weak_deps=false vim-minimal
dnf clean all
rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/
EORUN
# disable the flood of message on the console
COPY disable-flood.conf /usr/lib/sysctl.d/60-disable-flood.conf
COPY stalwart.container /usr/share/containers/systemd/stalwart.container
COPY caddy.tmpfile.conf /usr/lib/tmpfiles.d/caddy.conf
RUN bootc container lint --fatal-warnings 
