FROM quay.io/fedora/fedora-bootc@sha256:44df15ccc1a09813a3250f32b685a9330941792eefc5b63674a6d5ee1ac7a085

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
