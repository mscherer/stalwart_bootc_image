FROM quay.io/fedora/fedora-bootc@sha256:93c7f7852c0264340232a921ebe4f4011c30f7578cc8f29f28a52766402e9dc7

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
