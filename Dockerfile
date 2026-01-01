FROM quay.io/fedora/fedora-bootc@sha256:e4d6d3fe46223c7d4f022e7914bacb2216abbd22ea118a10d5684807e2c29597

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
