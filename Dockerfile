FROM quay.io/fedora/fedora-bootc@sha256:46f6253e16c958d89fe3457a8e39572f9716af3769a504f2b978f6b79959fc8b

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
