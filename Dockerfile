FROM quay.io/fedora/fedora-bootc@sha256:f04d3d5c371f8e07ee58abcd28187f8d99c24a7e7a089b551f36b23baf7a7609

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
