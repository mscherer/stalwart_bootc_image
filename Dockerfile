FROM quay.io/fedora/fedora-bootc@sha256:30d0a50a13fbe8e30dd9592d4e3af7f2ca2f0e78b65b10959a66d054bc807129

#
# empty space for easier rebasing
#

RUN mkdir -p /var/lib/stalwart
COPY stalwart.container /etc/containers/systemd/stalwart.container
RUN bootc container lint --fatal-warnings 
