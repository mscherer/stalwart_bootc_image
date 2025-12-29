FROM quay.io/fedora/fedora-bootc@sha256:44b545cdee8fc84d7d946d183aee5a3ef940de9ff5ead0364947346451a0f0ea

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
