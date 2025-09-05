FROM quay.io/fedora/fedora-bootc@sha256:1ca9ef5631c163c0bd5e4931c7be594634748beac91098618d4382cef0badabe

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
