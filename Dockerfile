FROM quay.io/fedora/fedora-bootc@sha256:38d638110d8a04c58616407e56e9749a2cd1432d4320ad7b17528278ffc50ad7

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
