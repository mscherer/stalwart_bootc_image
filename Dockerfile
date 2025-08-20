FROM quay.io/fedora/fedora-bootc@sha256:a72bc33192b192c9f4fb2e7b74ddce9601de63af6944ccb105547161f9a9a4e2

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
