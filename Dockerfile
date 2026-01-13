FROM quay.io/fedora/fedora-bootc@sha256:28ebf7e383057f979bc7fc55f5e783c3580ee836231c1cd1c9beae6ed1eea186

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
