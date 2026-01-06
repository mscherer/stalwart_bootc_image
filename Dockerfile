FROM quay.io/fedora/fedora-bootc@sha256:aa4d8d4861f70e7e6edcfb0fb4460860db1ac95cd646375a9ed9101b38f1334e

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
