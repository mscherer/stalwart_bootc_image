FROM quay.io/fedora/fedora-bootc@sha256:eb97d5c3fa9bac2733e1e367515a9a28986873f34618a56c27b8e1a3ebce7522

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
