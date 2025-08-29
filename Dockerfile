FROM quay.io/fedora/fedora-bootc@sha256:c38ab15ebe016d91892f0f6b046af5a4403588735157cf4198843a1cacbb239d

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
