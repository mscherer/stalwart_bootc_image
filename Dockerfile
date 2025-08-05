FROM quay.io/fedora/fedora-bootc@sha256:f5f58f8758ac842f2edc2445c0d95b0f0d7c7123b3fd7e58e8db871214a17ec0

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
