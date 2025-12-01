FROM quay.io/fedora/fedora-bootc@sha256:523fc801361ccb2e4b195cca9d2c8607b90fdb7a65f364253cb746e2b43258e4

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
