FROM quay.io/fedora/fedora-bootc@sha256:f95ab386a3ec7405de498a56062c8d7d0bcd622bfc2f260a588cacf12203a520

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
