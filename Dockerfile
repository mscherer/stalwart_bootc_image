FROM quay.io/fedora/fedora-bootc@sha256:a5d559d263d56233735b507503ce7ae8273693cbe4e87843f05bad8851a2668b

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
