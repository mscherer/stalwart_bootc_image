FROM quay.io/fedora/fedora-bootc@sha256:540939f0243bb28e173846ef3158a15015903d4fd2b11a57b60d1116928caa9c

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
