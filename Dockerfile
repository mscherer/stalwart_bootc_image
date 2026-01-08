FROM quay.io/fedora/fedora-bootc@sha256:07f1f0c87a62eb85eb66096a7460cbceba62f87ed6aee970ea2be1be5245e920

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
