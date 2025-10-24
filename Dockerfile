FROM quay.io/fedora/fedora-bootc@sha256:9c46ecfcfed3efd81a91e65aa4351723940e9b42a4ba6b4fe020f4d7020c2bd2

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
