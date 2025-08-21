FROM quay.io/fedora/fedora-bootc@sha256:75fa251d0528136c2b322ed1dc2bdee4f786992b61e3b570e0e3f202eeb50098

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
