FROM quay.io/fedora/fedora-bootc@sha256:be629db2ab373c054d8f611a214d21b6e16ce48118068d47cb2f1f87a0e30cfa

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
