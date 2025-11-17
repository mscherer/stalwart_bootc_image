FROM quay.io/fedora/fedora-bootc@sha256:5ebb61b021ce5c9d16dde6c1b58c606d8ef90bd43315059a84b75b5097476496

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
