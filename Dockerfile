FROM quay.io/fedora/fedora-bootc@sha256:9aa313086c4d4c74e1aafd57792615fdce18e8f53519c9d88a284a8f85ce61ea

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
