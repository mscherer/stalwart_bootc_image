FROM quay.io/bootc-devel/fedora-bootc-44-minimal@sha256:dc58bdf6cbc94e85ba0bdcc56cac51f0ebb3ef6e97be34933316ead0f2399b79
#
# empty space for easier rebasing
#

# install caddy (reverse proxy) and various stuff
RUN <<EORUN
# bug fixes
# fix/workaround https://bugzilla.redhat.com/show_bug.cgi?id=2432642
dnf install -y --setopt=install_weak_deps=false bubblewrap
# broken due to https://src.fedoraproject.org/rpms/systemd/c/67538c79f250eecbd904aa87e72a44cb3b5ef6f4
# fix/workaround https://bugzilla.redhat.com/show_bug.cgi?id=2507313 
# https://gitlab.com/fedora/bootc/base-images/-/merge_requests/646
dnf install -y --setopt=install_weak_deps=false dbus

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
COPY stalwart/stalwart.tmpfiles.conf /usr/lib/tmpfiles.d/stalwart.tmpfiles.conf

# add the config system
# it watch on a specific directory and I can upload the config with scp
COPY stalwart-config/apply_stalwart_config.sh /usr/local/bin/apply_stalwart_config.sh
COPY stalwart-config/stalwart-apply-config.service /usr/lib/systemd/system/stalwart-apply-config.service
COPY stalwart-config/stalwart-apply-config.path /usr/lib/systemd/system/stalwart-apply-config.path

COPY nftables/firewall.nft /usr/local/etc/firewall.nft
COPY nftables/nftables.conf /etc/sysconfig/nftables.conf

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

# see https://src.fedoraproject.org/rpms/caddy/pull-request/16
COPY caddy/caddy.tmpfile.conf /usr/lib/tmpfiles.d/caddy.conf

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

#RUN bootc container lint --fatal-warnings
