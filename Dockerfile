FROM quay.io/fedora/fedora-bootc@sha256:ca5b507b79d8b3818a2512a9e377b0f7bb0350e160d2b65fa2c2b6c199628615

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
