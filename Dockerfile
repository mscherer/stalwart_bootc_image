FROM quay.io/fedora/fedora-bootc@sha256:ebe9cd10da14dd2eef1763669021755b2df5d9e4dbf78285576cd7664a73ad15

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
