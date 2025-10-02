FROM quay.io/fedora/fedora-bootc@sha256:6507c999598b626c804ef4f4a4fe5279c538a884dae832206816c000c4d7490b

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
