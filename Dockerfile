FROM quay.io/fedora/fedora-bootc@sha256:8e62597b596826a4133c1218554be22477503cce9310dd59ec25781ef4d6e375

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
