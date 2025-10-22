FROM quay.io/fedora/fedora-bootc@sha256:7ff56572cecea43329019e677e3ca2c1a912b7c99d3697f7a7cdc1136c2a861a

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
