FROM quay.io/fedora/fedora-bootc@sha256:251ae2d380e0339cb9bc41311ae9714019091f49c600dea2d03675045928bcfb

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
