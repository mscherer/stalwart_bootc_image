FROM quay.io/fedora/fedora-bootc@sha256:b645953d205a06947709b1b210805f728ba46bf2cfe68bb917190f65967f6d33

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
