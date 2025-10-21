FROM quay.io/fedora/fedora-bootc@sha256:fa9a1f1c439d0adee999b3ff8afb6ac36df598cf18da810ccb24240ef87afd7e

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
