FROM quay.io/fedora/fedora-bootc@sha256:04e6dd46f72930088b3dc3cf8b941faf2897530d48978801b7f9ab061c0ad736

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
