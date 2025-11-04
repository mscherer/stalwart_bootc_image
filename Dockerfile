FROM quay.io/fedora/fedora-bootc@sha256:b193a5166e08d74047c336b4161f6f6ecbca79ac7a238daeaad21a0d3a377a10

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
