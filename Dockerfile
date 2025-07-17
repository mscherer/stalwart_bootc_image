FROM quay.io/fedora/fedora-bootc@sha256:c11282eb05242f817fd969982091c3eaab8c2a58b248463ca1b098a00799fc2a

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
