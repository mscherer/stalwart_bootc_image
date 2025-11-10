FROM quay.io/fedora/fedora-bootc@sha256:a1164485e0a895d73118243805103407c2a9bad4c825fb27133b1ca7dfea5b37

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
