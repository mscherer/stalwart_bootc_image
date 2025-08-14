FROM quay.io/fedora/fedora-bootc@sha256:542143b5cc30ec6d95302f0f9674974a7c4bc006212c77d5ed1422e3b2d69e62

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
