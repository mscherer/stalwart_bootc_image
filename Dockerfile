FROM quay.io/bootc-devel/fedora-bootc-43-minimal@sha256:448f745d3240001e7275d102b590ebb1d093e8928447e8664aef2cc9aa34ec5c
#
# empty space for easier rebasing
#

# install caddy (reverse proxy)
RUN <<EORUN
dnf install -y --setopt=install_weak_deps=false -y caddy socat htop mosh iftop strace tcpdump vim nmap lshw openssh-server systemd-networkd-defaults systemd-networkd
dnf clean all
rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/
EORUN
COPY stalwart.container /etc/containers/systemd/stalwart.container
COPY caddy.tmpfile.conf /usr/lib/tmpfiles.d/caddy.conf
RUN bootc container lint --fatal-warnings 
