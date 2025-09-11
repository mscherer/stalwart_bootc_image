FROM quay.io/fedora/fedora-bootc@sha256:ad972a58271657b776b5ad19ed78d3ca859255c449906aa61336a878da282779

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
