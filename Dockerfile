FROM quay.io/fedora/fedora-bootc@sha256:5ea1bd52238026d6c27a5b48122d6322f5c04203919540f603fdf6210430c5c4

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
