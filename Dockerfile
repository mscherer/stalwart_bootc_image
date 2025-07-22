FROM quay.io/fedora/fedora-bootc@sha256:4807abf46898e5074a2dcf8edd8cab918b081985a07e1b4dd414a95e8cec3214

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
