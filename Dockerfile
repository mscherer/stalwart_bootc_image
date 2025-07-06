FROM quay.io/fedora/fedora-bootc@sha256:ab07abf4f1263ae405f348e6e9a0677fadb85d9fa0a18bc555060f14102e6ed9

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
