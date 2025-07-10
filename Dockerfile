FROM quay.io/fedora/fedora-bootc@sha256:d1cebf43b31a76874d49ff9e73146e1b2adb32ccf575a8347c3237901ec614c1

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
