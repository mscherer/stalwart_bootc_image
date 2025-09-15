FROM quay.io/fedora/fedora-bootc@sha256:129f5d89e948a210176bf21efbcd099dfc554f77272db3b34a9bed4203910dc3

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
