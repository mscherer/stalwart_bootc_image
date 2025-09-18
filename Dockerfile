FROM quay.io/fedora/fedora-bootc@sha256:0dd2e254aaa0424dfa84df77952de5f7c9733cb1fffa3a9eaa3d0f1564493637

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
