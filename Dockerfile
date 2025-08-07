FROM quay.io/fedora/fedora-bootc@sha256:fc618c2cfe175b9ce585da5411238facd832793d9c143617dd462169c7e21a64

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
