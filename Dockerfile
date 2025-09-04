FROM quay.io/fedora/fedora-bootc@sha256:8d3fd085d9d59d2d0c3aa49b270f8897d2a65f97d984b43b196a4a7236d19a9d

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
