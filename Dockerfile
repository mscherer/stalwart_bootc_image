FROM quay.io/fedora/fedora-bootc@sha256:1f29f76082a6f370bf93f4b3104d210d9d05e6c17f621772c9a3c488a3e8080f

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
