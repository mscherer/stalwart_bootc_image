FROM quay.io/fedora/fedora-bootc@sha256:854b56a9902b667ef7d3b93eee9b8cedffeddf1fb1e07e9334749882df2127fb

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
