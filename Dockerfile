FROM quay.io/fedora/fedora-bootc@sha256:085ae8315e4fd555b6f985548e47e3bee70c09990ac78849d12b73041219c64e

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
