FROM quay.io/fedora/fedora-bootc@sha256:e3a821007a8e8fa7adb8ecef8d36c6b454313314dee04b618620794aeffe8d02

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
