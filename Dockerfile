FROM quay.io/fedora/fedora-bootc@sha256:1909326816201ef036f31186d13b94cb9c61fa39be2cc5c0680b330ad5fc7427

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
