FROM quay.io/fedora/fedora-bootc@sha256:8b6f28ea84e1dbcdf17115f85464582f3ba4939c754c763497f5cfea6a79f39e

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
