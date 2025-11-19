FROM quay.io/fedora/fedora-bootc@sha256:658d1dc7924f192dcaa5e1d9c6f86d3c4667f41d9dede5e553a9cac24306d3d2

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
