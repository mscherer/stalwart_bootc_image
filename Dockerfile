FROM quay.io/fedora/fedora-bootc@sha256:7f75a9f9d5ed99234f18fa03f88ee1d544df35c7e5b3fcbc8eef07111b9b5fd7

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
