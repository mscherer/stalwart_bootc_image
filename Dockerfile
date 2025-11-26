FROM quay.io/fedora/fedora-bootc@sha256:658ff221fd62184a22b1f57fc5937124c5e0622ecf6a6dbbd6e979e23ad820db

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
