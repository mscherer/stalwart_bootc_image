FROM quay.io/bootc-devel/fedora-bootc-43-minimal@sha256:d98388f46c9efbb24f57d5d35a0fb1febcb8270743e398777c90a2c2a0cf2fb7
#
# empty space for easier rebasing
#

# install caddy (reverse proxy) and various stuff
RUN <<EORUN
# fix/workaround https://bugzilla.redhat.com/show_bug.cgi?id=2432642
dnf install -y --setopt=install_weak_deps=false bubblewrap

dnf install -y --setopt=install_weak_deps=false caddy

# systemd-networkd-defaults pull systemd-networkd
dnf install -y --setopt=install_weak_deps=false openssh-server systemd-networkd-defaults jq tar xz
dnf clean all
rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/ /run/dnf 

EORUN

# disable the flood of message on the console
COPY disable-flood.conf /usr/lib/sysctl.d/60-disable-flood.conf

# add stalwart
COPY stalwart/stalwart.container /usr/share/containers/systemd/stalwart.container
COPY stalwart/config.json /usr/local/etc/config.json
COPY stalwart/stalwart-recovery /usr/local/bin/stalwart-recovery

RUN <<EORUN3
PREFIX="x86_64-unknown-linux-gnu"
DIRECTORY="stalwart-cli-${PREFIX}"
BINARY="${DIRECTORY}/stalwart-cli"
URL=$(curl -s "https://api.github.com/repos/stalwartlabs/cli/releases/latest" | jq -r ".assets | map(select(.name == \"stalwart-cli-${PREFIX}.tar.xz\"))[0].browser_download_url")

curl --silent --location ${URL} | tar --xz --directory /tmp --get --file - ${BINARY}

mv /tmp/${BINARY} /usr/local/bin/stalwart-cli
rm -Rf /tmp/${DIRECTORY}
EORUN3

COPY stalwart/stalwart_recovery_env.tmpfiles.conf /usr/lib/tmpfiles.d/stalwart_recovery_env.tmpfiles.conf

# needed as bootc container lint complain about it. Some work should be done
# to get if fixed upstream
COPY container_lint.tmpfiles.conf /usr/lib/tmpfiles.d/container_lint.conf

COPY motd.conf /usr/lib/motd.d/

COPY set_hostname/set_hostname.service /usr/lib/systemd/system/set_hostname.service
COPY set_hostname/set_hostname.sh      /usr/local/bin/set_hostname.sh

COPY set_ipv6/set_ipv6.service /usr/lib/systemd/system/set_ipv6.service
COPY set_ipv6/set_ipv6.sh      /usr/local/bin/set_ipv6.sh

# needed to start the various software at boot
COPY mail_server.preset /usr/lib/systemd/system-preset/01-mail_server.preset
RUN <<EORUN2
systemctl preset-all
EORUN2

RUN bootc container lint --fatal-warnings
