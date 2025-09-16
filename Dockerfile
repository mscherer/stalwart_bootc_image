FROM quay.io/fedora/fedora-bootc@sha256:287722503375cab9ad19b192032bf437ae6e5f964cfc1be3b180077d2d097440

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
