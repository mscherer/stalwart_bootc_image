FROM quay.io/fedora/fedora-bootc@sha256:e017aa6df3d571c58caae840ad5b952554eb3ee8139d41e928004c2d2493161a

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
