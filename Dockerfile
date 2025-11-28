FROM quay.io/fedora/fedora-bootc@sha256:d59095589a69d4b336bf2c46d98d2173b3985005b3736c91c6a7706666a8bb7a

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
