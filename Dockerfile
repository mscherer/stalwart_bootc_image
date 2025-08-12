FROM quay.io/fedora/fedora-bootc@sha256:4090a899b4c87f5b989d55c6d74fd6abf5ac918693ebd2851e888dd3fe781d58

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
