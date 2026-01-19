FROM quay.io/fedora/fedora-bootc@sha256:d80f2c08a48e1fdf9a8cd5863ee979456b5bb232a8e40d70aa984f69c3d50d55

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
