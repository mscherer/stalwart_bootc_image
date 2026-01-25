FROM quay.io/bootc-devel/fedora-bootc-43-minimal@sha256:448f745d3240001e7275d102b590ebb1d093e8928447e8664aef2cc9aa34ec5c
#
# empty space for easier rebasing
#

# install caddy (reverse proxy)
RUN <<EORUN
# https://systemd.io/PRESET/
# If multiple lines apply to a unit name, the first matching one takes precedence over all others.
echo > /usr/lib/systemd/system-preset/01-mail_server.preset <<EOF
enable caddy.service
enable systemd-networkd.service
enable sshd.service
EOF

# disable the flood of message on the console
echo > /etc/sysctl.d/disable-flood.conf <<EOF
# https://superuser.com/questions/351387/how-to-stop-kernel-messages-from-flooding-my-console
kernel.printk="2 4 1 7"
EOF

dnf install -y --setopt=install_weak_deps=false caddy 

dnf install -y --setopt=install_weak_deps=false htop iftop strace tcpdump lshw iproute

dnf install -y --setopt=install_weak_deps=false openssh-server systemd-networkd-defaults systemd-networkd

dnf install -y --setopt=install_weak_deps=false vim-minimal
dnf clean all
rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/
EORUN
COPY stalwart.container /etc/containers/systemd/stalwart.container
COPY caddy.tmpfile.conf /usr/lib/tmpfiles.d/caddy.conf
RUN bootc container lint --fatal-warnings 
