FROM quay.io/fedora/fedora-bootc@sha256:31b4c553f6a598d7b630469f39e60183c3f49e6a1b112ed8d89ff3b2b9d1b776

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
