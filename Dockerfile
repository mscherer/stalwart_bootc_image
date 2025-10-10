FROM quay.io/fedora/fedora-bootc@sha256:eda7c16c2c4e1567bb1f9fb0bd4b2d2e50304fec8956923f3b511c223d512cfb

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
