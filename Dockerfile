FROM quay.io/fedora/fedora-bootc@sha256:07775acef998a2a28cb4f76ac975186513f7718d345256955e5f644b8d1cbf77

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
