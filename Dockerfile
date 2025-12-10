FROM quay.io/fedora/fedora-bootc@sha256:ca10b82f03624c374eae5addf96c2acf36c569739832a5f5c14c29cddde2e7e3

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
