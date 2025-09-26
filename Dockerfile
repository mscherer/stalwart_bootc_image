FROM quay.io/fedora/fedora-bootc@sha256:5357b83082aa2f9ccbcc98df44d3510becc87e23359d2131a4c0443bab3f8f4e

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
