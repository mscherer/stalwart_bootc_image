FROM quay.io/fedora/fedora-bootc@sha256:59a830f6ef5f01ebf79abf3bc230c0b490aa8e13e1a34568ad7f155bf5485d95

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
