FROM quay.io/fedora/fedora-bootc@sha256:6e29f50bfcad32b74b2ea60d053dec5a2a17605340f2f7f8294e8f93f50b22af

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
