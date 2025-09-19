FROM quay.io/fedora/fedora-bootc@sha256:f3419bde08cf1c0932ee09545b645c4db1a5f5bdbf12a514db48f896d0673dd5

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
