FROM quay.io/fedora/fedora-bootc@sha256:b1d637d819e1fb475cf1dff661edf3cff37789c38c90a109b22c92b5d2a96ebe

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
