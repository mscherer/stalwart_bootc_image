FROM quay.io/fedora/fedora-bootc@sha256:301c0e17e38b8440801eae614f0041da5c899a84390145685f18e317f2e6058e

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
