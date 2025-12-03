FROM quay.io/fedora/fedora-bootc@sha256:03e4f359c928ca4766bd4bfc2014768df8eeb1afd901370f698a0666a5a78acd

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
