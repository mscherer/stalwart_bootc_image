FROM quay.io/fedora/fedora-bootc@sha256:c1aa66b9afe9a3d82575ea4343a4bc59f8f17edae873be7c3aa0b218d092bf2a

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
