FROM quay.io/fedora/fedora-bootc@sha256:728b574fec502a36e43e6289c06da66936a0d39751d41927ac68b6d8409a9522

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
