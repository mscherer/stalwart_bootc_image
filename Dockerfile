FROM quay.io/fedora/fedora-bootc@sha256:eda1927cced18a879d521d3b1bf0162fb4a1fb2af7d83d86b3201d7a57c0fee2

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
