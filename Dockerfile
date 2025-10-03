FROM quay.io/fedora/fedora-bootc@sha256:dccc6bfc59e6af221a62399b351196f5c1edd82e8c119629a2b168bdd75d1ce1

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
